; DESCRIPTION: Places a magenta line segment connecting (151, 190) to (233, 218).
; PLAN: r0=151(x1), r1=190(y1), r2=233(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 190
LDI r2, 233
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
