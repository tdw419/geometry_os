; DESCRIPTION: Places a magenta line segment connecting (472, 233) to (246, 167).
; PLAN: r0=472(x1), r1=233(y1), r2=246(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 233
LDI r2, 246
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
