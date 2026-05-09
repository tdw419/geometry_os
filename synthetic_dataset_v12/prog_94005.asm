; DESCRIPTION: Places a yellow line segment connecting (31, 149) to (426, 150).
; PLAN: r0=31(x1), r1=149(y1), r2=426(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 149
LDI r2, 426
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
