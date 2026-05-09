; DESCRIPTION: Places a yellow line segment connecting (36, 9) to (294, 148).
; PLAN: r0=36(x1), r1=9(y1), r2=294(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 9
LDI r2, 294
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
