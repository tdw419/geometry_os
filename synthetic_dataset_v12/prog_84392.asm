; DESCRIPTION: Draws a yellow line from (208, 149) to (251, 145).
; PLAN: r0=208(x1), r1=149(y1), r2=251(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 149
LDI r2, 251
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
