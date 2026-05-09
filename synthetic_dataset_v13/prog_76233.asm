; DESCRIPTION: Places a magenta line segment connecting (27, 225) to (377, 10).
; PLAN: r0=27(x1), r1=225(y1), r2=377(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 225
LDI r2, 377
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
