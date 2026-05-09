; DESCRIPTION: Draws a yellow line from (164, 110) to (165, 79).
; PLAN: r0=164(x1), r1=110(y1), r2=165(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 110
LDI r2, 165
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
