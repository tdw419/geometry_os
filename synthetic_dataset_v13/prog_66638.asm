; DESCRIPTION: Renders a white box of size 119x65 starting at (78, 78).
; PLAN: r0=78(x), r1=78(y), r2=119(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 78
LDI r2, 119
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
