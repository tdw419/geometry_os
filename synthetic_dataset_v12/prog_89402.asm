; DESCRIPTION: Renders a white line between points (210, 17) and (43, 158).
; PLAN: r0=210(x1), r1=17(y1), r2=43(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 17
LDI r2, 43
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
