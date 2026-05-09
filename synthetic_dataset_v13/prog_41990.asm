; DESCRIPTION: Renders a yellow line between points (453, 111) and (313, 200).
; PLAN: r0=453(x1), r1=111(y1), r2=313(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 111
LDI r2, 313
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
