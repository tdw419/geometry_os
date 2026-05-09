; DESCRIPTION: Renders a green line between points (406, 176) and (117, 96).
; PLAN: r0=406(x1), r1=176(y1), r2=117(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 176
LDI r2, 117
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
