; DESCRIPTION: Composite: Draws a red rectangle at (241, 87) with width 45 and height 51 then Places a purple line segment connecting (400, 87) to (183, 183).
; PLAN: r0=241(x), r1=87(y), r2=45(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x1), r6=87(y1), r7=183(x2), r8=183(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 87
LDI r2, 45
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 87
LDI r7, 183
LDI r8, 183
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
