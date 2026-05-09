; DESCRIPTION: Places a purple line segment connecting (102, 228) to (68, 167).
; PLAN: r0=102(x1), r1=228(y1), r2=68(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 228
LDI r2, 68
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
