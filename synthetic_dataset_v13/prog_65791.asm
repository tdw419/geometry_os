; DESCRIPTION: Draws a blue line from (440, 85) to (342, 55).
; PLAN: r0=440(x1), r1=85(y1), r2=342(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 85
LDI r2, 342
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
