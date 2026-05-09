; DESCRIPTION: Places a purple line segment connecting (388, 144) to (198, 228).
; PLAN: r0=388(x1), r1=144(y1), r2=198(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 144
LDI r2, 198
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
