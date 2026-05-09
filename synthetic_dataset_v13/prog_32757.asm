; DESCRIPTION: Renders a green line between points (129, 73) and (459, 120).
; PLAN: r0=129(x1), r1=73(y1), r2=459(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 73
LDI r2, 459
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
