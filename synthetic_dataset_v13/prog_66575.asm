; DESCRIPTION: Draws a magenta line from (44, 218) to (33, 204).
; PLAN: r0=44(x1), r1=218(y1), r2=33(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 218
LDI r2, 33
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
