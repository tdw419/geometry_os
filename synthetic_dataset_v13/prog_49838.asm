; DESCRIPTION: Composite: Renders a purple box of size 95x53 starting at (317, 105) then Draws a red line from (31, 180) to (388, 229).
; PLAN: r0=317(x), r1=105(y), r2=95(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=31(x1), r6=180(y1), r7=388(x2), r8=229(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 105
LDI r2, 95
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 180
LDI r7, 388
LDI r8, 229
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
