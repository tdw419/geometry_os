; DESCRIPTION: Draws a blue line from (420, 14) to (75, 200).
; PLAN: r0=420(x1), r1=14(y1), r2=75(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 14
LDI r2, 75
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
