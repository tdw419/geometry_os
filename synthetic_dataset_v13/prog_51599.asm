; DESCRIPTION: Places a magenta line segment connecting (246, 38) to (12, 243).
; PLAN: r0=246(x1), r1=38(y1), r2=12(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 38
LDI r2, 12
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
