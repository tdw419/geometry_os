; DESCRIPTION: Renders a green line between points (381, 189) and (248, 69).
; PLAN: r0=381(x1), r1=189(y1), r2=248(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 189
LDI r2, 248
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
