; DESCRIPTION: Renders a red line between points (408, 234) and (170, 197).
; PLAN: r0=408(x1), r1=234(y1), r2=170(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 234
LDI r2, 170
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
