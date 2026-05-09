; DESCRIPTION: Renders a yellow line between points (469, 186) and (161, 226).
; PLAN: r0=469(x1), r1=186(y1), r2=161(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 186
LDI r2, 161
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
