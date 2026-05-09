; DESCRIPTION: Renders a white line between points (336, 104) and (80, 46).
; PLAN: r0=336(x1), r1=104(y1), r2=80(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 104
LDI r2, 80
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
