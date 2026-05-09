; DESCRIPTION: Renders a white line between points (133, 253) and (208, 49).
; PLAN: r0=133(x1), r1=253(y1), r2=208(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 253
LDI r2, 208
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
