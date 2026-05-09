; DESCRIPTION: Places a magenta line segment connecting (29, 58) to (340, 64).
; PLAN: r0=29(x1), r1=58(y1), r2=340(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 58
LDI r2, 340
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
