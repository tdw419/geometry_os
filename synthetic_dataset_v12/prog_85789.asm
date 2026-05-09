; DESCRIPTION: Composite: Draws a blue circle centered at (323, 220) with radius 34 then Sets a single yellow pixel at (449, 36) then Draws a orange line from (239, 15) to (374, 123).
; PLAN: r0=323(x), r1=220(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=449(x), r6=36(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=239(x1), r11=15(y1), r12=374(x2), r13=123(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 220
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 449
LDI r6, 36
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 239
LDI r11, 15
LDI r12, 374
LDI r13, 123
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
