; DESCRIPTION: Places a magenta line segment connecting (211, 190) to (164, 38).
; PLAN: r0=211(x1), r1=190(y1), r2=164(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 190
LDI r2, 164
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
