; DESCRIPTION: Places a purple line segment connecting (267, 152) to (347, 61).
; PLAN: r0=267(x1), r1=152(y1), r2=347(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 152
LDI r2, 347
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
