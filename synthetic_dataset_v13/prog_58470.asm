; DESCRIPTION: Renders a white box of size 20x78 starting at (71, 100).
; PLAN: r0=71(x), r1=100(y), r2=20(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 100
LDI r2, 20
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
