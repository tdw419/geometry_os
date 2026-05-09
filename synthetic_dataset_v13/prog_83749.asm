; DESCRIPTION: Renders a white line between points (230, 5) and (192, 104).
; PLAN: r0=230(x1), r1=5(y1), r2=192(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 5
LDI r2, 192
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
