; DESCRIPTION: Places a magenta line segment connecting (141, 120) to (372, 64).
; PLAN: r0=141(x1), r1=120(y1), r2=372(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 120
LDI r2, 372
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
