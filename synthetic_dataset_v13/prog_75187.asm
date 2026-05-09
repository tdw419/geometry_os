; DESCRIPTION: Composite: Renders a blue box of size 51x36 starting at (162, 79) then Renders a red line between points (399, 252) and (186, 250).
; PLAN: r0=162(x), r1=79(y), r2=51(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=399(x1), r6=252(y1), r7=186(x2), r8=250(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 79
LDI r2, 51
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 252
LDI r7, 186
LDI r8, 250
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
