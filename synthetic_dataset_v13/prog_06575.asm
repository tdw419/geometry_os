; DESCRIPTION: Places a yellow line segment connecting (245, 83) to (478, 182).
; PLAN: r0=245(x1), r1=83(y1), r2=478(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 83
LDI r2, 478
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
