; DESCRIPTION: Places a magenta line segment connecting (76, 17) to (284, 199).
; PLAN: r0=76(x1), r1=17(y1), r2=284(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 17
LDI r2, 284
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
