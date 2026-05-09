; DESCRIPTION: Composite: Places a purple 87x92 rectangle at position (118, 123) then Places a green line segment connecting (466, 159) to (229, 254).
; PLAN: r0=118(x), r1=123(y), r2=87(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=466(x1), r6=159(y1), r7=229(x2), r8=254(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 123
LDI r2, 87
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 159
LDI r7, 229
LDI r8, 254
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
