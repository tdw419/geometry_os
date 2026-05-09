; DESCRIPTION: Renders a white box of size 21x102 starting at (194, 110).
; PLAN: r0=194(x), r1=110(y), r2=21(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 110
LDI r2, 21
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
