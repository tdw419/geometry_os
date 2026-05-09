; DESCRIPTION: Places a yellow line segment connecting (194, 129) to (345, 171).
; PLAN: r0=194(x1), r1=129(y1), r2=345(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 129
LDI r2, 345
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
