; DESCRIPTION: Renders a red line between points (63, 112) and (198, 15).
; PLAN: r0=63(x1), r1=112(y1), r2=198(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 112
LDI r2, 198
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
