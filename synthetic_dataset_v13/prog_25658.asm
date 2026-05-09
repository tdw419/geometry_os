; DESCRIPTION: Composite: Creates a purple rectangular region at (69, 197) spanning 74 by 49 pixels then Places a purple line segment connecting (36, 30) to (227, 69).
; PLAN: r0=69(x), r1=197(y), r2=74(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x1), r6=30(y1), r7=227(x2), r8=69(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 197
LDI r2, 74
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 30
LDI r7, 227
LDI r8, 69
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
