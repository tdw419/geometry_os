; DESCRIPTION: Renders a white line between points (502, 9) and (136, 160).
; PLAN: r0=502(x1), r1=9(y1), r2=136(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 9
LDI r2, 136
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
