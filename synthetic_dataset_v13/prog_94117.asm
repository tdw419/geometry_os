; DESCRIPTION: Renders a black line between points (49, 129) and (385, 37).
; PLAN: r0=49(x1), r1=129(y1), r2=385(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 129
LDI r2, 385
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
