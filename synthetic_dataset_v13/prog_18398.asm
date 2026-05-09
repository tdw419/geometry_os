; DESCRIPTION: Draws a black line from (255, 243) to (133, 79).
; PLAN: r0=255(x1), r1=243(y1), r2=133(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 243
LDI r2, 133
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
