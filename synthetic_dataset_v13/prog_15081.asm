; DESCRIPTION: Places a black line segment connecting (126, 231) to (151, 36).
; PLAN: r0=126(x1), r1=231(y1), r2=151(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 231
LDI r2, 151
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
