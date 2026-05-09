; DESCRIPTION: Renders a green line between points (406, 118) and (394, 217).
; PLAN: r0=406(x1), r1=118(y1), r2=394(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 118
LDI r2, 394
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
