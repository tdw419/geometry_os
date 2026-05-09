; DESCRIPTION: Composite: Renders a purple line between points (162, 46) and (17, 146) then Places a red 50x70 rectangle at position (432, 35).
; PLAN: r0=162(x1), r1=46(y1), r2=17(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=35(y), r7=50(width), r8=70(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 46
LDI r2, 17
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 35
LDI r7, 50
LDI r8, 70
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
