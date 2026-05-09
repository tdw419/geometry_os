; DESCRIPTION: Composite: Renders a red line between points (11, 106) and (158, 60) then Places a red 52x70 rectangle at position (180, 52).
; PLAN: r0=11(x1), r1=106(y1), r2=158(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=52(y), r7=52(width), r8=70(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 11
LDI r1, 106
LDI r2, 158
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 52
LDI r7, 52
LDI r8, 70
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
