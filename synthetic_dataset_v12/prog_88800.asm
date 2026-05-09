; DESCRIPTION: Places a magenta line segment connecting (124, 127) to (75, 196).
; PLAN: r0=124(x1), r1=127(y1), r2=75(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 127
LDI r2, 75
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
