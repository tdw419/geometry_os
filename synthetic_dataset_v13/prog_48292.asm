; DESCRIPTION: Renders a red line between points (166, 253) and (147, 37).
; PLAN: r0=166(x1), r1=253(y1), r2=147(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 253
LDI r2, 147
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
