; DESCRIPTION: Places a purple line segment connecting (7, 53) to (193, 27).
; PLAN: r0=7(x1), r1=53(y1), r2=193(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 53
LDI r2, 193
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
