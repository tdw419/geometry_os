; DESCRIPTION: Draws a red line from (140, 249) to (443, 137).
; PLAN: r0=140(x1), r1=249(y1), r2=443(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 249
LDI r2, 443
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
