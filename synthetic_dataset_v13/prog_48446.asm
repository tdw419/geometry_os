; DESCRIPTION: Renders a orange line between points (392, 63) and (73, 3).
; PLAN: r0=392(x1), r1=63(y1), r2=73(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 63
LDI r2, 73
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
