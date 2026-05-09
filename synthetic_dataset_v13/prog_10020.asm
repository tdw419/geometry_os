; DESCRIPTION: Renders a yellow line between points (373, 199) and (220, 135).
; PLAN: r0=373(x1), r1=199(y1), r2=220(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 199
LDI r2, 220
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
