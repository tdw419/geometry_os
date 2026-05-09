; DESCRIPTION: Places a magenta line segment connecting (130, 234) to (442, 204).
; PLAN: r0=130(x1), r1=234(y1), r2=442(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 234
LDI r2, 442
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
