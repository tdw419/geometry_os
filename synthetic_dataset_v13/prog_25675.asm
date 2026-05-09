; DESCRIPTION: Places a magenta line segment connecting (246, 191) to (174, 222).
; PLAN: r0=246(x1), r1=191(y1), r2=174(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 191
LDI r2, 174
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
