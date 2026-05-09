; DESCRIPTION: Draws a magenta line from (68, 247) to (259, 225).
; PLAN: r0=68(x1), r1=247(y1), r2=259(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 247
LDI r2, 259
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
