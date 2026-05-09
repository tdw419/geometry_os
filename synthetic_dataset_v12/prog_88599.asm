; DESCRIPTION: Renders a black line between points (209, 170) and (365, 102).
; PLAN: r0=209(x1), r1=170(y1), r2=365(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 170
LDI r2, 365
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
