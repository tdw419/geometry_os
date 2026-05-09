; DESCRIPTION: Composite: Places a green circle of radius 66 at center (354, 105) then Draws a purple line from (313, 36) to (184, 177) then Sets a single blue pixel at (305, 141).
; PLAN: r0=354(x), r1=105(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=313(x1), r6=36(y1), r7=184(x2), r8=177(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=305(x), r11=141(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 354
LDI r1, 105
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 313
LDI r6, 36
LDI r7, 184
LDI r8, 177
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 141
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
