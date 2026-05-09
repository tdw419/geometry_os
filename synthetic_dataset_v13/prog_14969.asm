; DESCRIPTION: Places a magenta line segment connecting (447, 3) to (108, 210).
; PLAN: r0=447(x1), r1=3(y1), r2=108(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 3
LDI r2, 108
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
