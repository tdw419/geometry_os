; DESCRIPTION: Places a magenta line segment connecting (164, 36) to (177, 188).
; PLAN: r0=164(x1), r1=36(y1), r2=177(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 36
LDI r2, 177
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
