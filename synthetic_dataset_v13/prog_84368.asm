; DESCRIPTION: Composite: Renders a green disk with center (431, 188) and radius 20 then Draws a magenta rectangle at (451, 106) with width 27 and height 85 then Sets a single orange pixel at (505, 83).
; PLAN: r0=431(x), r1=188(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x), r6=106(y), r7=27(width), r8=85(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=505(x), r11=83(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 431
LDI r1, 188
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 106
LDI r7, 27
LDI r8, 85
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 505
LDI r11, 83
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
