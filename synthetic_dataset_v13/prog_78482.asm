; DESCRIPTION: Draws a red line from (197, 172) to (170, 205).
; PLAN: r0=197(x1), r1=172(y1), r2=170(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 172
LDI r2, 170
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
