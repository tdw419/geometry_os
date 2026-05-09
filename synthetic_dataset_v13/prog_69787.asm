; DESCRIPTION: Renders a orange line between points (60, 147) and (121, 255).
; PLAN: r0=60(x1), r1=147(y1), r2=121(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 147
LDI r2, 121
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
