; DESCRIPTION: Places a magenta line segment connecting (160, 236) to (264, 248).
; PLAN: r0=160(x1), r1=236(y1), r2=264(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 236
LDI r2, 264
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
