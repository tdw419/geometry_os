; DESCRIPTION: Places a blue line segment connecting (435, 212) to (259, 126).
; PLAN: r0=435(x1), r1=212(y1), r2=259(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 212
LDI r2, 259
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
