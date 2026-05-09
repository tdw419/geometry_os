; DESCRIPTION: Places a magenta line segment connecting (253, 250) to (288, 222).
; PLAN: r0=253(x1), r1=250(y1), r2=288(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 250
LDI r2, 288
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
