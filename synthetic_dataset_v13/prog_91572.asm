; DESCRIPTION: Places a magenta line segment connecting (399, 100) to (16, 239).
; PLAN: r0=399(x1), r1=100(y1), r2=16(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 100
LDI r2, 16
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
