; DESCRIPTION: Draws a magenta line from (194, 104) to (141, 91).
; PLAN: r0=194(x1), r1=104(y1), r2=141(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 104
LDI r2, 141
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
