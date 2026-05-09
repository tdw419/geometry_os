; DESCRIPTION: Composite: Places a yellow circle of radius 49 at center (282, 181) then Places a red line segment connecting (426, 107) to (7, 206).
; PLAN: r0=282(x), r1=181(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x1), r6=107(y1), r7=7(x2), r8=206(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 282
LDI r1, 181
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 107
LDI r7, 7
LDI r8, 206
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
