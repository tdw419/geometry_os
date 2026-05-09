; DESCRIPTION: Places a green line segment connecting (192, 81) to (301, 126).
; PLAN: r0=192(x1), r1=81(y1), r2=301(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 81
LDI r2, 301
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
