; DESCRIPTION: Draws a red line from (194, 193) to (107, 131).
; PLAN: r0=194(x1), r1=193(y1), r2=107(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 193
LDI r2, 107
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
