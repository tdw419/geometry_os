; DESCRIPTION: Renders a black line between points (98, 129) and (298, 34).
; PLAN: r0=98(x1), r1=129(y1), r2=298(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 129
LDI r2, 298
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
