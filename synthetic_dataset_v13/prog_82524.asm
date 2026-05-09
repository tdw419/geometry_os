; DESCRIPTION: Composite: Places a red line segment connecting (162, 79) to (375, 106) then Places a yellow 20x12 rectangle at position (271, 179).
; PLAN: r0=162(x1), r1=79(y1), r2=375(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=179(y), r7=20(width), r8=12(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 79
LDI r2, 375
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 179
LDI r7, 20
LDI r8, 12
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
