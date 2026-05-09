; DESCRIPTION: Renders a green line between points (339, 75) and (460, 65).
; PLAN: r0=339(x1), r1=75(y1), r2=460(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 75
LDI r2, 460
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
