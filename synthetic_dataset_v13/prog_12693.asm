; DESCRIPTION: Places a purple line segment connecting (434, 109) to (23, 166).
; PLAN: r0=434(x1), r1=109(y1), r2=23(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 109
LDI r2, 23
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
