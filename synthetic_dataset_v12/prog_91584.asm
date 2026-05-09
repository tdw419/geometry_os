; DESCRIPTION: Places a blue line segment connecting (272, 168) to (62, 126).
; PLAN: r0=272(x1), r1=168(y1), r2=62(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 168
LDI r2, 62
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
