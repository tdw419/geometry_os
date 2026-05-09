; DESCRIPTION: Composite: Places a yellow line segment connecting (449, 180) to (108, 122) then Draws a black circle centered at (186, 167) with radius 35.
; PLAN: r0=449(x1), r1=180(y1), r2=108(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=167(y), r7=35(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 449
LDI r1, 180
LDI r2, 108
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 167
LDI r7, 35
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
