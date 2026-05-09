; DESCRIPTION: Places a magenta line segment connecting (421, 155) to (196, 239).
; PLAN: r0=421(x1), r1=155(y1), r2=196(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 155
LDI r2, 196
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
