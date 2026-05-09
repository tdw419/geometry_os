; DESCRIPTION: Renders a white line between points (240, 17) and (249, 206).
; PLAN: r0=240(x1), r1=17(y1), r2=249(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 17
LDI r2, 249
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
