; DESCRIPTION: Renders a white line between points (424, 208) and (137, 11).
; PLAN: r0=424(x1), r1=208(y1), r2=137(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 208
LDI r2, 137
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
