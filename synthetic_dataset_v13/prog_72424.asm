; DESCRIPTION: Renders a black line between points (241, 173) and (355, 223).
; PLAN: r0=241(x1), r1=173(y1), r2=355(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 173
LDI r2, 355
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
