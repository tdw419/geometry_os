; DESCRIPTION: Renders a orange line between points (392, 240) and (195, 79).
; PLAN: r0=392(x1), r1=240(y1), r2=195(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 240
LDI r2, 195
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
