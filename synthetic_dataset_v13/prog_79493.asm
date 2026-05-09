; DESCRIPTION: Draws a magenta line from (444, 201) to (255, 70).
; PLAN: r0=444(x1), r1=201(y1), r2=255(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 201
LDI r2, 255
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
