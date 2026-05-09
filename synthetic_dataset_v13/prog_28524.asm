; DESCRIPTION: Draws a blue line from (399, 178) to (108, 75).
; PLAN: r0=399(x1), r1=178(y1), r2=108(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 178
LDI r2, 108
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
