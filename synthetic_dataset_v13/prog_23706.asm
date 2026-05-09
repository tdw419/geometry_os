; DESCRIPTION: Places a purple line segment connecting (434, 150) to (259, 255).
; PLAN: r0=434(x1), r1=150(y1), r2=259(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 150
LDI r2, 259
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
