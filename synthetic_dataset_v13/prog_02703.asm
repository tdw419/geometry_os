; DESCRIPTION: Renders a white line between points (260, 37) and (43, 211).
; PLAN: r0=260(x1), r1=37(y1), r2=43(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 37
LDI r2, 43
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
