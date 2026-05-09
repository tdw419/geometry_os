; DESCRIPTION: Renders a yellow line between points (298, 218) and (142, 15).
; PLAN: r0=298(x1), r1=218(y1), r2=142(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 218
LDI r2, 142
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
