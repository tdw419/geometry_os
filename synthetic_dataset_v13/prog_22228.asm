; DESCRIPTION: Places a magenta line segment connecting (156, 152) to (160, 222).
; PLAN: r0=156(x1), r1=152(y1), r2=160(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 152
LDI r2, 160
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
