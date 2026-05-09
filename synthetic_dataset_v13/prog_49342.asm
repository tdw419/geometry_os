; DESCRIPTION: Composite: Sets a single blue pixel at (198, 250) then Draws a cyan line from (279, 210) to (272, 251) then Renders a black disk with center (62, 65) and radius 46.
; PLAN: r0=198(x), r1=250(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=279(x1), r6=210(y1), r7=272(x2), r8=251(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=62(x), r11=65(y), r12=46(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 198
LDI r1, 250
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 279
LDI r6, 210
LDI r7, 272
LDI r8, 251
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 65
LDI r12, 46
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
