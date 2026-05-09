; DESCRIPTION: Places a magenta line segment connecting (20, 77) to (247, 64).
; PLAN: r0=20(x1), r1=77(y1), r2=247(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 77
LDI r2, 247
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
