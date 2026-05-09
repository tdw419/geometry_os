; DESCRIPTION: Renders a red line between points (140, 245) and (147, 173).
; PLAN: r0=140(x1), r1=245(y1), r2=147(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 245
LDI r2, 147
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
