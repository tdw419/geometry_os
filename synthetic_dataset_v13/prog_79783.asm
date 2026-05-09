; DESCRIPTION: Composite: Draws a purple rectangle at (274, 46) with width 101 and height 104 then Places a red line segment connecting (281, 50) to (409, 53).
; PLAN: r0=274(x), r1=46(y), r2=101(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x1), r6=50(y1), r7=409(x2), r8=53(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 46
LDI r2, 101
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 50
LDI r7, 409
LDI r8, 53
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
