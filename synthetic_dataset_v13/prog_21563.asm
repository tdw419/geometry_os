; DESCRIPTION: Places a magenta line segment connecting (222, 138) to (392, 192).
; PLAN: r0=222(x1), r1=138(y1), r2=392(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 138
LDI r2, 392
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
