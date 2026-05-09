; DESCRIPTION: Renders a green line between points (165, 14) and (402, 233).
; PLAN: r0=165(x1), r1=14(y1), r2=402(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 14
LDI r2, 402
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
