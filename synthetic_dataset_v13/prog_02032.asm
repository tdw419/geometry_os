; DESCRIPTION: Renders a white box of size 77x98 starting at (327, 132).
; PLAN: r0=327(x), r1=132(y), r2=77(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 132
LDI r2, 77
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
