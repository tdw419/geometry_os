; DESCRIPTION: Renders a white line between points (204, 92) and (298, 223).
; PLAN: r0=204(x1), r1=92(y1), r2=298(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 92
LDI r2, 298
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
