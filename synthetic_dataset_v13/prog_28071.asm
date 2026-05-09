; DESCRIPTION: Draws a magenta line from (241, 196) to (339, 247).
; PLAN: r0=241(x1), r1=196(y1), r2=339(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 196
LDI r2, 339
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
