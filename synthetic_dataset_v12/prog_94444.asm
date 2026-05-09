; DESCRIPTION: Places a magenta line segment connecting (81, 153) to (354, 120).
; PLAN: r0=81(x1), r1=153(y1), r2=354(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 153
LDI r2, 354
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
