; DESCRIPTION: Draws a magenta line from (152, 97) to (250, 11).
; PLAN: r0=152(x1), r1=97(y1), r2=250(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 97
LDI r2, 250
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
