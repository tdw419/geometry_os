; DESCRIPTION: Places a magenta line segment connecting (310, 243) to (508, 186).
; PLAN: r0=310(x1), r1=243(y1), r2=508(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 243
LDI r2, 508
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
