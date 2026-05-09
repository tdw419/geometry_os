; DESCRIPTION: Renders a black line between points (495, 154) and (315, 203).
; PLAN: r0=495(x1), r1=154(y1), r2=315(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 154
LDI r2, 315
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
