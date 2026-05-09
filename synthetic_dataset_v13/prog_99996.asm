; DESCRIPTION: Places a green line segment connecting (345, 22) to (320, 126).
; PLAN: r0=345(x1), r1=22(y1), r2=320(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 22
LDI r2, 320
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
