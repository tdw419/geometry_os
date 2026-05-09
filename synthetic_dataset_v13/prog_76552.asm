; DESCRIPTION: Places a magenta line segment connecting (284, 156) to (341, 65).
; PLAN: r0=284(x1), r1=156(y1), r2=341(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 156
LDI r2, 341
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
