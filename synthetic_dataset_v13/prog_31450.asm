; DESCRIPTION: Renders a black line between points (54, 152) and (139, 8).
; PLAN: r0=54(x1), r1=152(y1), r2=139(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 152
LDI r2, 139
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
