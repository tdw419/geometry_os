; DESCRIPTION: Composite: Sets a single yellow pixel at (61, 5) then Places a blue line segment connecting (312, 93) to (393, 132) then Renders a yellow disk with center (342, 139) and radius 41.
; PLAN: r0=61(x), r1=5(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=312(x1), r6=93(y1), r7=393(x2), r8=132(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=342(x), r11=139(y), r12=41(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 61
LDI r1, 5
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 312
LDI r6, 93
LDI r7, 393
LDI r8, 132
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 139
LDI r12, 41
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
