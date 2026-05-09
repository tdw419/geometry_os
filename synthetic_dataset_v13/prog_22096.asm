; DESCRIPTION: Places a magenta line segment connecting (114, 133) to (228, 12).
; PLAN: r0=114(x1), r1=133(y1), r2=228(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 133
LDI r2, 228
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
