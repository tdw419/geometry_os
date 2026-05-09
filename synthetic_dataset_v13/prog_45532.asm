; DESCRIPTION: Renders a white line between points (239, 144) and (424, 201).
; PLAN: r0=239(x1), r1=144(y1), r2=424(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 144
LDI r2, 424
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
