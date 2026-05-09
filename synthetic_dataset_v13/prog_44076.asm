; DESCRIPTION: Renders a red line between points (77, 174) and (358, 248).
; PLAN: r0=77(x1), r1=174(y1), r2=358(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 174
LDI r2, 358
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
