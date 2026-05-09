; DESCRIPTION: Places a magenta line segment connecting (186, 6) to (486, 197).
; PLAN: r0=186(x1), r1=6(y1), r2=486(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 6
LDI r2, 486
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
