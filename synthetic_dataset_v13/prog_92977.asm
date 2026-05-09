; DESCRIPTION: Renders a black line between points (418, 83) and (352, 104).
; PLAN: r0=418(x1), r1=83(y1), r2=352(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 83
LDI r2, 352
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
