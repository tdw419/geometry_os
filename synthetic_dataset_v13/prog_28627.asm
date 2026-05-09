; DESCRIPTION: Renders a green line between points (207, 73) and (99, 104).
; PLAN: r0=207(x1), r1=73(y1), r2=99(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 73
LDI r2, 99
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
