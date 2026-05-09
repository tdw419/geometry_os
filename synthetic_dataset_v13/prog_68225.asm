; DESCRIPTION: Places a magenta line segment connecting (412, 233) to (385, 15).
; PLAN: r0=412(x1), r1=233(y1), r2=385(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 233
LDI r2, 385
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
