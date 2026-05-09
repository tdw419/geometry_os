; DESCRIPTION: Renders a orange line between points (180, 141) and (198, 37).
; PLAN: r0=180(x1), r1=141(y1), r2=198(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 141
LDI r2, 198
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
