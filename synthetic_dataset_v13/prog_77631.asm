; DESCRIPTION: Places a blue line segment connecting (325, 4) to (180, 103).
; PLAN: r0=325(x1), r1=4(y1), r2=180(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 4
LDI r2, 180
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
