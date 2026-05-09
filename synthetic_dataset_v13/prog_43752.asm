; DESCRIPTION: Places a blue line segment connecting (277, 68) to (296, 87).
; PLAN: r0=277(x1), r1=68(y1), r2=296(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 68
LDI r2, 296
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
