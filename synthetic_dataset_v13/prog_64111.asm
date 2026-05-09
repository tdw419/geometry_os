; DESCRIPTION: Places a magenta line segment connecting (355, 46) to (190, 165).
; PLAN: r0=355(x1), r1=46(y1), r2=190(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 46
LDI r2, 190
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
