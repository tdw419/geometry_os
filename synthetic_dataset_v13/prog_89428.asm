; DESCRIPTION: Renders a green line between points (53, 189) and (115, 254).
; PLAN: r0=53(x1), r1=189(y1), r2=115(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 189
LDI r2, 115
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
