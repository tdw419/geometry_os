; DESCRIPTION: Renders a yellow line between points (362, 110) and (340, 135).
; PLAN: r0=362(x1), r1=110(y1), r2=340(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 110
LDI r2, 340
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
