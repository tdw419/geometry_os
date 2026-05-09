; DESCRIPTION: Draws a blue line from (188, 15) to (275, 89).
; PLAN: r0=188(x1), r1=15(y1), r2=275(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 15
LDI r2, 275
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
