; DESCRIPTION: Renders a red line between points (358, 84) and (103, 56).
; PLAN: r0=358(x1), r1=84(y1), r2=103(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 84
LDI r2, 103
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
