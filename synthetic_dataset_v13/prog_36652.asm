; DESCRIPTION: Renders a red line between points (363, 153) and (263, 252).
; PLAN: r0=363(x1), r1=153(y1), r2=263(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 153
LDI r2, 263
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
