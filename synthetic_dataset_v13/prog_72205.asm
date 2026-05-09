; DESCRIPTION: Places a magenta line segment connecting (69, 43) to (245, 32).
; PLAN: r0=69(x1), r1=43(y1), r2=245(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 43
LDI r2, 245
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
