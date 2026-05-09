; DESCRIPTION: Places a yellow line segment connecting (144, 129) to (251, 175).
; PLAN: r0=144(x1), r1=129(y1), r2=251(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 129
LDI r2, 251
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
