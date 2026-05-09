; DESCRIPTION: Composite: Places a blue line segment connecting (287, 221) to (420, 156) then Draws a yellow circle centered at (315, 128) with radius 59 then Sets a single cyan pixel at (14, 19).
; PLAN: r0=287(x1), r1=221(y1), r2=420(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=128(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=14(x), r11=19(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 287
LDI r1, 221
LDI r2, 420
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 128
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 14
LDI r11, 19
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
