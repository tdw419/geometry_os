; DESCRIPTION: Renders a red line between points (104, 150) and (122, 79).
; PLAN: r0=104(x1), r1=150(y1), r2=122(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 150
LDI r2, 122
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
