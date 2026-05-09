; DESCRIPTION: Renders a green line between points (148, 189) and (66, 76).
; PLAN: r0=148(x1), r1=189(y1), r2=66(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 189
LDI r2, 66
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
