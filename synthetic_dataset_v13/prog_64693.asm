; DESCRIPTION: Composite: Places a purple line segment connecting (380, 50) to (314, 206) then Renders a red disk with center (131, 186) and radius 38.
; PLAN: r0=380(x1), r1=50(y1), r2=314(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=186(y), r7=38(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 380
LDI r1, 50
LDI r2, 314
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 186
LDI r7, 38
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
