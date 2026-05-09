; DESCRIPTION: Composite: Sets a single red pixel at (243, 3) then Renders a yellow line between points (490, 60) and (127, 222) then Places a blue circle of radius 79 at center (418, 89).
; PLAN: r0=243(x), r1=3(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=490(x1), r6=60(y1), r7=127(x2), r8=222(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=418(x), r11=89(y), r12=79(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 243
LDI r1, 3
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 490
LDI r6, 60
LDI r7, 127
LDI r8, 222
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 89
LDI r12, 79
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
