; DESCRIPTION: Composite: Places a magenta line segment connecting (188, 160) to (381, 188) then Places a purple 87x48 rectangle at position (252, 121).
; PLAN: r0=188(x1), r1=160(y1), r2=381(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=252(x), r6=121(y), r7=87(width), r8=48(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 160
LDI r2, 381
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 121
LDI r7, 87
LDI r8, 48
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
