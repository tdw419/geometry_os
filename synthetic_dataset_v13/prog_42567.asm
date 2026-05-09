; DESCRIPTION: Renders a yellow line between points (336, 83) and (391, 57).
; PLAN: r0=336(x1), r1=83(y1), r2=391(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 83
LDI r2, 391
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
