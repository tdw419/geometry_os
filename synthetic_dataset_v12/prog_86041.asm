; DESCRIPTION: Draws a magenta line from (259, 36) to (259, 124).
; PLAN: r0=259(x1), r1=36(y1), r2=259(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 36
LDI r2, 259
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
