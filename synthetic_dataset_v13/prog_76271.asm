; DESCRIPTION: Draws a blue line from (338, 183) to (162, 40).
; PLAN: r0=338(x1), r1=183(y1), r2=162(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 183
LDI r2, 162
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
