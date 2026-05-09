; DESCRIPTION: Renders a red line between points (363, 209) and (358, 252).
; PLAN: r0=363(x1), r1=209(y1), r2=358(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 209
LDI r2, 358
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
