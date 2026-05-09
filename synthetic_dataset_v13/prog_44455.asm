; DESCRIPTION: Composite: Draws a blue line from (241, 52) to (368, 47) then Renders a green box of size 31x51 starting at (49, 159).
; PLAN: r0=241(x1), r1=52(y1), r2=368(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=49(x), r6=159(y), r7=31(width), r8=51(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 52
LDI r2, 368
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 159
LDI r7, 31
LDI r8, 51
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
