; DESCRIPTION: Composite: Renders a red disk with center (153, 122) and radius 64 then Renders a yellow box of size 25x100 starting at (449, 109) then Places a orange line segment connecting (374, 51) to (462, 235).
; PLAN: r0=153(x), r1=122(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=449(x), r6=109(y), r7=25(width), r8=100(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=374(x1), r11=51(y1), r12=462(x2), r13=235(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 122
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 449
LDI r6, 109
LDI r7, 25
LDI r8, 100
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 51
LDI r12, 462
LDI r13, 235
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
