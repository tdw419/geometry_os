; DESCRIPTION: Places a yellow line segment connecting (242, 83) to (176, 147).
; PLAN: r0=242(x1), r1=83(y1), r2=176(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 83
LDI r2, 176
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
