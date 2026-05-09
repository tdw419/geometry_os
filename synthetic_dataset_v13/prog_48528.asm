; DESCRIPTION: Composite: Renders a purple line between points (301, 5) and (448, 223) then Renders a purple box of size 49x15 starting at (452, 53).
; PLAN: r0=301(x1), r1=5(y1), r2=448(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=53(y), r7=49(width), r8=15(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 5
LDI r2, 448
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 53
LDI r7, 49
LDI r8, 15
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
