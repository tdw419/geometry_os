; DESCRIPTION: Renders a green line between points (104, 38) and (57, 17).
; PLAN: r0=104(x1), r1=38(y1), r2=57(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 38
LDI r2, 57
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
