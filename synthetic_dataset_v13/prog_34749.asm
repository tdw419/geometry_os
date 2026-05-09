; DESCRIPTION: Places a magenta line segment connecting (130, 154) to (319, 160).
; PLAN: r0=130(x1), r1=154(y1), r2=319(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 154
LDI r2, 319
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
