; DESCRIPTION: Draws a blue line from (162, 3) to (467, 15).
; PLAN: r0=162(x1), r1=3(y1), r2=467(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 3
LDI r2, 467
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
