; DESCRIPTION: Renders a white line between points (330, 83) and (195, 101).
; PLAN: r0=330(x1), r1=83(y1), r2=195(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 83
LDI r2, 195
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
