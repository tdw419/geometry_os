; DESCRIPTION: Renders a white line between points (330, 248) and (43, 90).
; PLAN: r0=330(x1), r1=248(y1), r2=43(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 248
LDI r2, 43
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
