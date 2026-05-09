; DESCRIPTION: Composite: Places a magenta line segment connecting (322, 230) to (294, 40) then Draws a green circle centered at (211, 144) with radius 20 then Sets a single orange pixel at (510, 30).
; PLAN: r0=322(x1), r1=230(y1), r2=294(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=144(y), r7=20(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=510(x), r11=30(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 322
LDI r1, 230
LDI r2, 294
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 144
LDI r7, 20
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 510
LDI r11, 30
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
