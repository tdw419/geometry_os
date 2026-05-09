; DESCRIPTION: Composite: Renders a red line between points (365, 96) and (216, 2) then Places a purple 98x106 rectangle at position (342, 17).
; PLAN: r0=365(x1), r1=96(y1), r2=216(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=342(x), r6=17(y), r7=98(width), r8=106(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 96
LDI r2, 216
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 17
LDI r7, 98
LDI r8, 106
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
