; DESCRIPTION: Composite: Draws a black circle centered at (24, 60) with radius 21 then Draws a blue line from (234, 111) to (460, 122) then Sets a single yellow pixel at (287, 218).
; PLAN: r0=24(x), r1=60(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x1), r6=111(y1), r7=460(x2), r8=122(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=287(x), r11=218(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 24
LDI r1, 60
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 111
LDI r7, 460
LDI r8, 122
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 218
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
