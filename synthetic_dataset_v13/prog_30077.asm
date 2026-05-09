; DESCRIPTION: Draws a blue line from (440, 200) to (108, 195).
; PLAN: r0=440(x1), r1=200(y1), r2=108(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 200
LDI r2, 108
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
