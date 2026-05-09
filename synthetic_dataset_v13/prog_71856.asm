; DESCRIPTION: Places a magenta line segment connecting (78, 222) to (420, 255).
; PLAN: r0=78(x1), r1=222(y1), r2=420(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 222
LDI r2, 420
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
