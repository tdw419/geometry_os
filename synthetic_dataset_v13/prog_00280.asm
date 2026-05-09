; DESCRIPTION: Draws a blue line from (103, 123) to (20, 65).
; PLAN: r0=103(x1), r1=123(y1), r2=20(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 123
LDI r2, 20
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
