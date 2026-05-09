; DESCRIPTION: Draws a red line from (71, 164) to (170, 199).
; PLAN: r0=71(x1), r1=164(y1), r2=170(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 164
LDI r2, 170
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
