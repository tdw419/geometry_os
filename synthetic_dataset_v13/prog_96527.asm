; DESCRIPTION: Places a magenta line segment connecting (240, 205) to (496, 138).
; PLAN: r0=240(x1), r1=205(y1), r2=496(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 205
LDI r2, 496
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
