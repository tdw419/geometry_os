; DESCRIPTION: Draws a blue line from (5, 84) to (152, 89).
; PLAN: r0=5(x1), r1=84(y1), r2=152(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 84
LDI r2, 152
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
