; DESCRIPTION: Renders a white line between points (310, 187) and (83, 99).
; PLAN: r0=310(x1), r1=187(y1), r2=83(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 187
LDI r2, 83
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
