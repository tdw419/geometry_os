; DESCRIPTION: Renders a white line between points (424, 134) and (156, 144).
; PLAN: r0=424(x1), r1=134(y1), r2=156(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 134
LDI r2, 156
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
