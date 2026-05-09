; DESCRIPTION: Renders a green line between points (77, 53) and (310, 26).
; PLAN: r0=77(x1), r1=53(y1), r2=310(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 53
LDI r2, 310
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
