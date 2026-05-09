; DESCRIPTION: Renders a green line between points (339, 104) and (132, 208).
; PLAN: r0=339(x1), r1=104(y1), r2=132(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 104
LDI r2, 132
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
