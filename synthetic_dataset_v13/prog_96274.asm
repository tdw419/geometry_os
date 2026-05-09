; DESCRIPTION: Places a green line segment connecting (345, 149) to (444, 76).
; PLAN: r0=345(x1), r1=149(y1), r2=444(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 149
LDI r2, 444
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
