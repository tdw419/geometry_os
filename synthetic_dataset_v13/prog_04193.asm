; DESCRIPTION: Composite: Renders a blue disk with center (100, 176) and radius 19 then Creates a green rectangular region at (127, 65) spanning 15 by 86 pixels.
; PLAN: r0=100(x), r1=176(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x), r6=65(y), r7=15(width), r8=86(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 176
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 65
LDI r7, 15
LDI r8, 86
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
