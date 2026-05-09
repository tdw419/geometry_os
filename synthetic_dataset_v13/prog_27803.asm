; DESCRIPTION: Renders a white line between points (17, 154) and (359, 134).
; PLAN: r0=17(x1), r1=154(y1), r2=359(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 154
LDI r2, 359
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
