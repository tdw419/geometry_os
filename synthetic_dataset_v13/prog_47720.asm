; DESCRIPTION: Draws a magenta line from (425, 169) to (338, 90).
; PLAN: r0=425(x1), r1=169(y1), r2=338(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 169
LDI r2, 338
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
