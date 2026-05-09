; DESCRIPTION: Renders a black line between points (455, 170) and (329, 57).
; PLAN: r0=455(x1), r1=170(y1), r2=329(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 170
LDI r2, 329
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
