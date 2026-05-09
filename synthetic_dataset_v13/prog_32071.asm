; DESCRIPTION: Composite: Renders a purple line between points (158, 207) and (53, 91) then Places a red 85x80 rectangle at position (173, 89).
; PLAN: r0=158(x1), r1=207(y1), r2=53(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=89(y), r7=85(width), r8=80(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 158
LDI r1, 207
LDI r2, 53
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 89
LDI r7, 85
LDI r8, 80
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
