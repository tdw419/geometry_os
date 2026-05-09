; DESCRIPTION: Draws a blue line from (260, 51) to (375, 95).
; PLAN: r0=260(x1), r1=51(y1), r2=375(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 51
LDI r2, 375
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
