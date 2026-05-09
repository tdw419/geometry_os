; DESCRIPTION: Composite: Draws a cyan line from (186, 226) to (261, 160) then Creates a cyan circular shape at (389, 121) with radius 39 then Sets a single blue pixel at (436, 13).
; PLAN: r0=186(x1), r1=226(y1), r2=261(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=389(x), r6=121(y), r7=39(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=436(x), r11=13(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 186
LDI r1, 226
LDI r2, 261
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 121
LDI r7, 39
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 436
LDI r11, 13
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
