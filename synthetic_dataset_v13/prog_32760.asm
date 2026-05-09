; DESCRIPTION: Renders a orange line between points (394, 181) and (186, 133).
; PLAN: r0=394(x1), r1=181(y1), r2=186(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 181
LDI r2, 186
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
