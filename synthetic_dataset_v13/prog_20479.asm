; DESCRIPTION: Places a purple line segment connecting (474, 228) to (452, 152).
; PLAN: r0=474(x1), r1=228(y1), r2=452(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 228
LDI r2, 452
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
