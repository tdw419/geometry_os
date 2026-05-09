; DESCRIPTION: Places a magenta line segment connecting (4, 202) to (436, 210).
; PLAN: r0=4(x1), r1=202(y1), r2=436(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 202
LDI r2, 436
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
