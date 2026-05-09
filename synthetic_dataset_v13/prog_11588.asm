; DESCRIPTION: Renders a green line between points (431, 104) and (68, 121).
; PLAN: r0=431(x1), r1=104(y1), r2=68(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 104
LDI r2, 68
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
