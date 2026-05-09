; DESCRIPTION: Renders a white line between points (194, 231) and (226, 157).
; PLAN: r0=194(x1), r1=231(y1), r2=226(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 231
LDI r2, 226
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
