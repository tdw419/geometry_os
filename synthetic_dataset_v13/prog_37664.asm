; DESCRIPTION: Renders a black line between points (355, 170) and (223, 166).
; PLAN: r0=355(x1), r1=170(y1), r2=223(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 170
LDI r2, 223
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
