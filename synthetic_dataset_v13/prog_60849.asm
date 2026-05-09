; DESCRIPTION: Renders a black line between points (249, 174) and (495, 9).
; PLAN: r0=249(x1), r1=174(y1), r2=495(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 174
LDI r2, 495
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
