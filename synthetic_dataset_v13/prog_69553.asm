; DESCRIPTION: Places a yellow line segment connecting (490, 133) to (401, 228).
; PLAN: r0=490(x1), r1=133(y1), r2=401(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 133
LDI r2, 401
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
