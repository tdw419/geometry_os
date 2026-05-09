; DESCRIPTION: Places a magenta line segment connecting (124, 111) to (499, 145).
; PLAN: r0=124(x1), r1=111(y1), r2=499(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 111
LDI r2, 499
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
