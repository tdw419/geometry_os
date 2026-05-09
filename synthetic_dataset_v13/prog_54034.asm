; DESCRIPTION: Renders a green line between points (148, 142) and (63, 195).
; PLAN: r0=148(x1), r1=142(y1), r2=63(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 142
LDI r2, 63
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
