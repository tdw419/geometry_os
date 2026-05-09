; DESCRIPTION: Places a magenta line segment connecting (21, 112) to (16, 13).
; PLAN: r0=21(x1), r1=112(y1), r2=16(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 112
LDI r2, 16
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
