; DESCRIPTION: Places a yellow line segment connecting (345, 192) to (367, 150).
; PLAN: r0=345(x1), r1=192(y1), r2=367(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 192
LDI r2, 367
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
