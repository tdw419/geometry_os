; DESCRIPTION: Renders a cyan line between points (314, 222) and (51, 88).
; PLAN: r0=314(x1), r1=222(y1), r2=51(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 222
LDI r2, 51
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
