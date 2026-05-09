; DESCRIPTION: Draws a magenta line from (390, 104) to (443, 87).
; PLAN: r0=390(x1), r1=104(y1), r2=443(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 104
LDI r2, 443
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
