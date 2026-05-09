; DESCRIPTION: Composite: Places a yellow circle of radius 37 at center (212, 181) then Places a purple line segment connecting (481, 41) to (450, 163).
; PLAN: r0=212(x), r1=181(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=481(x1), r6=41(y1), r7=450(x2), r8=163(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 181
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 481
LDI r6, 41
LDI r7, 450
LDI r8, 163
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
