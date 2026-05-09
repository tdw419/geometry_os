; DESCRIPTION: Composite: Places a purple dot at position (497, 173) then Draws a blue line from (302, 38) to (333, 127) then Draws a yellow circle centered at (102, 180) with radius 64.
; PLAN: r0=497(x), r1=173(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=302(x1), r6=38(y1), r7=333(x2), r8=127(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=102(x), r11=180(y), r12=64(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 497
LDI r1, 173
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 302
LDI r6, 38
LDI r7, 333
LDI r8, 127
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 180
LDI r12, 64
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
