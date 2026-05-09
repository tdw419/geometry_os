; DESCRIPTION: Composite: Draws a white line from (12, 107) to (376, 214) then Places a purple circle of radius 43 at center (366, 168).
; PLAN: r0=12(x1), r1=107(y1), r2=376(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=366(x), r6=168(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 107
LDI r2, 376
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 168
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
