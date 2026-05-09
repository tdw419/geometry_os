; DESCRIPTION: Composite: Places a purple 70x19 rectangle at position (316, 48) then Places a red line segment connecting (40, 141) to (82, 183).
; PLAN: r0=316(x), r1=48(y), r2=70(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x1), r6=141(y1), r7=82(x2), r8=183(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 48
LDI r2, 70
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 141
LDI r7, 82
LDI r8, 183
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
