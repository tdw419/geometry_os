; DESCRIPTION: Renders a orange line between points (198, 44) and (0, 74).
; PLAN: r0=198(x1), r1=44(y1), r2=0(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 44
LDI r2, 0
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
