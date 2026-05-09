; DESCRIPTION: Composite: Places a green circle of radius 75 at center (352, 81) then Sets a single yellow pixel at (385, 84) then Places a magenta line segment connecting (207, 48) to (363, 205).
; PLAN: r0=352(x), r1=81(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=84(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=207(x1), r11=48(y1), r12=363(x2), r13=205(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 81
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 84
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 207
LDI r11, 48
LDI r12, 363
LDI r13, 205
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
