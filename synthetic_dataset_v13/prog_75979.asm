; DESCRIPTION: Renders a green line between points (253, 49) and (249, 195).
; PLAN: r0=253(x1), r1=49(y1), r2=249(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 49
LDI r2, 249
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
