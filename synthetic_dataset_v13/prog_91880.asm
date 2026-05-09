; DESCRIPTION: Composite: Places a purple 51x75 rectangle at position (146, 15) then Renders a red line between points (248, 98) and (456, 207).
; PLAN: r0=146(x), r1=15(y), r2=51(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x1), r6=98(y1), r7=456(x2), r8=207(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 15
LDI r2, 51
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 98
LDI r7, 456
LDI r8, 207
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
