; DESCRIPTION: Renders a yellow line between points (506, 220) and (156, 40).
; PLAN: r0=506(x1), r1=220(y1), r2=156(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 220
LDI r2, 156
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
