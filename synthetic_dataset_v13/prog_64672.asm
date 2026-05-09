; DESCRIPTION: Places a magenta line segment connecting (454, 220) to (3, 173).
; PLAN: r0=454(x1), r1=220(y1), r2=3(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 220
LDI r2, 3
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
