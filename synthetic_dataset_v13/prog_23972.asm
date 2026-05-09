; DESCRIPTION: Renders a white line between points (24, 23) and (121, 183).
; PLAN: r0=24(x1), r1=23(y1), r2=121(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 23
LDI r2, 121
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
