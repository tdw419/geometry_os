; DESCRIPTION: Renders a orange line between points (248, 127) and (95, 171).
; PLAN: r0=248(x1), r1=127(y1), r2=95(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 127
LDI r2, 95
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
