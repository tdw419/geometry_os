; DESCRIPTION: Places a yellow line segment connecting (57, 149) to (175, 31).
; PLAN: r0=57(x1), r1=149(y1), r2=175(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 149
LDI r2, 175
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
