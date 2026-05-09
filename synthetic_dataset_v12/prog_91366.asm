; DESCRIPTION: Renders a green line between points (374, 92) and (339, 15).
; PLAN: r0=374(x1), r1=92(y1), r2=339(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 92
LDI r2, 339
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
