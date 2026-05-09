; DESCRIPTION: Places a purple line segment connecting (400, 87) to (59, 228).
; PLAN: r0=400(x1), r1=87(y1), r2=59(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 87
LDI r2, 59
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
