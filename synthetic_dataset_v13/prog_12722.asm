; DESCRIPTION: Draws a magenta line from (46, 91) to (110, 20).
; PLAN: r0=46(x1), r1=91(y1), r2=110(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 91
LDI r2, 110
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
