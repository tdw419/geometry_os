; DESCRIPTION: Renders a orange line between points (350, 155) and (198, 57).
; PLAN: r0=350(x1), r1=155(y1), r2=198(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 155
LDI r2, 198
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
