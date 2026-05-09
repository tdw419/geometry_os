; DESCRIPTION: Renders a white box of size 94x96 starting at (327, 3).
; PLAN: r0=327(x), r1=3(y), r2=94(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 3
LDI r2, 94
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
