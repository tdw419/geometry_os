; DESCRIPTION: Places a purple line segment connecting (277, 231) to (254, 209).
; PLAN: r0=277(x1), r1=231(y1), r2=254(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 231
LDI r2, 254
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
