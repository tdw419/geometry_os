; DESCRIPTION: Places a magenta line segment connecting (48, 214) to (246, 10).
; PLAN: r0=48(x1), r1=214(y1), r2=246(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 214
LDI r2, 246
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
