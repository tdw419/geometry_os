; DESCRIPTION: Composite: Renders a white box of size 100x120 starting at (182, 114) then Sets a single yellow pixel at (250, 225) then Places a black line segment connecting (114, 21) to (158, 180).
; PLAN: r0=182(x), r1=114(y), r2=100(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=250(x), r6=225(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=114(x1), r11=21(y1), r12=158(x2), r13=180(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 114
LDI r2, 100
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 225
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 114
LDI r11, 21
LDI r12, 158
LDI r13, 180
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
