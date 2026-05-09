; DESCRIPTION: Draws a magenta line from (417, 18) to (141, 225).
; PLAN: r0=417(x1), r1=18(y1), r2=141(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 18
LDI r2, 141
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
