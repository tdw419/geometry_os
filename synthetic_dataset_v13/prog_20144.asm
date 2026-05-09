; DESCRIPTION: Renders a black line between points (127, 188) and (342, 20).
; PLAN: r0=127(x1), r1=188(y1), r2=342(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 188
LDI r2, 342
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
