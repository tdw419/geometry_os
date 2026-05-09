; DESCRIPTION: Draws a magenta line from (31, 112) to (264, 168).
; PLAN: r0=31(x1), r1=112(y1), r2=264(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 112
LDI r2, 264
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
