; DESCRIPTION: Places a magenta line segment connecting (133, 13) to (481, 239).
; PLAN: r0=133(x1), r1=13(y1), r2=481(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 13
LDI r2, 481
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
