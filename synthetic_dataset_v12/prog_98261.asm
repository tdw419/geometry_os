; DESCRIPTION: Renders a red line between points (147, 214) and (126, 1).
; PLAN: r0=147(x1), r1=214(y1), r2=126(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 214
LDI r2, 126
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
