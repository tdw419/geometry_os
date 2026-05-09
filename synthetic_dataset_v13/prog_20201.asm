; DESCRIPTION: Renders a white line between points (170, 151) and (506, 48).
; PLAN: r0=170(x1), r1=151(y1), r2=506(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 151
LDI r2, 506
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
