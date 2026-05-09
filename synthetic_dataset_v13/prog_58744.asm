; DESCRIPTION: Renders a red line between points (427, 185) and (380, 142).
; PLAN: r0=427(x1), r1=185(y1), r2=380(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 185
LDI r2, 380
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
