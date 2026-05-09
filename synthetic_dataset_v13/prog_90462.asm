; DESCRIPTION: Composite: Renders a red line between points (419, 30) and (16, 11) then Creates a purple rectangular region at (179, 53) spanning 40 by 35 pixels.
; PLAN: r0=419(x1), r1=30(y1), r2=16(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=53(y), r7=40(width), r8=35(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 30
LDI r2, 16
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 53
LDI r7, 40
LDI r8, 35
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
