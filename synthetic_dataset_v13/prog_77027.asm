; DESCRIPTION: Composite: Places a orange 76x104 rectangle at position (14, 131) then Places a red line segment connecting (314, 200) to (179, 82) then Sets a single white pixel at (150, 0).
; PLAN: r0=14(x), r1=131(y), r2=76(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x1), r6=200(y1), r7=179(x2), r8=82(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=150(x), r11=0(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 14
LDI r1, 131
LDI r2, 76
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 200
LDI r7, 179
LDI r8, 82
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 0
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
