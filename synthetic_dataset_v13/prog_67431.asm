; DESCRIPTION: Composite: Creates a green rectangular region at (323, 52) spanning 81 by 55 pixels then Renders a orange disk with center (411, 140) and radius 27.
; PLAN: r0=323(x), r1=52(y), r2=81(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=411(x), r6=140(y), r7=27(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 323
LDI r1, 52
LDI r2, 81
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 140
LDI r7, 27
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
