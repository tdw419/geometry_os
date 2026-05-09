; DESCRIPTION: Renders a yellow line between points (426, 163) and (504, 200).
; PLAN: r0=426(x1), r1=163(y1), r2=504(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 163
LDI r2, 504
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
