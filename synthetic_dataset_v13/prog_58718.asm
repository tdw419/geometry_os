; DESCRIPTION: Composite: Places a blue line segment connecting (342, 123) to (118, 160) then Places a purple 24x88 rectangle at position (381, 19).
; PLAN: r0=342(x1), r1=123(y1), r2=118(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=19(y), r7=24(width), r8=88(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 342
LDI r1, 123
LDI r2, 118
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 19
LDI r7, 24
LDI r8, 88
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
