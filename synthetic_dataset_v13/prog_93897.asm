; DESCRIPTION: Renders a white box of size 20x83 starting at (71, 123).
; PLAN: r0=71(x), r1=123(y), r2=20(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 123
LDI r2, 20
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
