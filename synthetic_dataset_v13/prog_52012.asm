; DESCRIPTION: Places a magenta line segment connecting (360, 132) to (436, 19).
; PLAN: r0=360(x1), r1=132(y1), r2=436(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 132
LDI r2, 436
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
