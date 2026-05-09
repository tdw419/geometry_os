; DESCRIPTION: Renders a yellow line between points (436, 66) and (66, 7).
; PLAN: r0=436(x1), r1=66(y1), r2=66(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 66
LDI r2, 66
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
