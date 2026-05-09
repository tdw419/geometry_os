; DESCRIPTION: Draws a red line from (300, 140) to (368, 251).
; PLAN: r0=300(x1), r1=140(y1), r2=368(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 140
LDI r2, 368
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
