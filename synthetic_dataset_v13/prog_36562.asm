; DESCRIPTION: Composite: Draws a purple line from (103, 179) to (462, 133) then Places a red circle of radius 45 at center (95, 109).
; PLAN: r0=103(x1), r1=179(y1), r2=462(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=109(y), r7=45(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 103
LDI r1, 179
LDI r2, 462
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 109
LDI r7, 45
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
