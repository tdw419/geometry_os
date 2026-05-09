; DESCRIPTION: Places a yellow line segment connecting (97, 129) to (380, 130).
; PLAN: r0=97(x1), r1=129(y1), r2=380(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 129
LDI r2, 380
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
