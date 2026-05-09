; DESCRIPTION: Renders a yellow line between points (29, 142) and (220, 28).
; PLAN: r0=29(x1), r1=142(y1), r2=220(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 142
LDI r2, 220
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
