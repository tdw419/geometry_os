; DESCRIPTION: Places a yellow line segment connecting (162, 175) to (180, 44).
; PLAN: r0=162(x1), r1=175(y1), r2=180(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 175
LDI r2, 180
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
