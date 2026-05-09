; DESCRIPTION: Renders a white box of size 110x97 starting at (333, 1).
; PLAN: r0=333(x), r1=1(y), r2=110(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 1
LDI r2, 110
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
