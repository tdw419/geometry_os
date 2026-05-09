; DESCRIPTION: Places a magenta line segment connecting (355, 59) to (95, 177).
; PLAN: r0=355(x1), r1=59(y1), r2=95(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 59
LDI r2, 95
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
