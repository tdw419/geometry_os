; DESCRIPTION: Places a purple line segment connecting (401, 247) to (34, 228).
; PLAN: r0=401(x1), r1=247(y1), r2=34(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 247
LDI r2, 34
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
