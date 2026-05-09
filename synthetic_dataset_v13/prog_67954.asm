; DESCRIPTION: Renders a red line between points (173, 155) and (435, 79).
; PLAN: r0=173(x1), r1=155(y1), r2=435(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 155
LDI r2, 435
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
