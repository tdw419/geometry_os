; DESCRIPTION: Renders a green line between points (13, 110) and (460, 38).
; PLAN: r0=13(x1), r1=110(y1), r2=460(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 110
LDI r2, 460
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
