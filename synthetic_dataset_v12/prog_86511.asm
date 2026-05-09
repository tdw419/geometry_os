; DESCRIPTION: Renders a red line between points (120, 113) and (453, 107).
; PLAN: r0=120(x1), r1=113(y1), r2=453(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 113
LDI r2, 453
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
