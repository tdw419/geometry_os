; DESCRIPTION: Renders a green line between points (53, 189) and (11, 2).
; PLAN: r0=53(x1), r1=189(y1), r2=11(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 189
LDI r2, 11
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
