; DESCRIPTION: Renders a green line between points (456, 174) and (1, 233).
; PLAN: r0=456(x1), r1=174(y1), r2=1(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 174
LDI r2, 1
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
