; DESCRIPTION: Renders a yellow line between points (426, 2) and (248, 170).
; PLAN: r0=426(x1), r1=2(y1), r2=248(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 2
LDI r2, 248
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
