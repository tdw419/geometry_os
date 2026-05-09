; DESCRIPTION: Places a magenta line segment connecting (367, 43) to (222, 16).
; PLAN: r0=367(x1), r1=43(y1), r2=222(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 43
LDI r2, 222
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
