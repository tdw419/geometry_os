; DESCRIPTION: Draws a magenta line from (124, 196) to (163, 10).
; PLAN: r0=124(x1), r1=196(y1), r2=163(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 196
LDI r2, 163
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
