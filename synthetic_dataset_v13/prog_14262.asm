; DESCRIPTION: Renders a black line between points (199, 209) and (217, 245).
; PLAN: r0=199(x1), r1=209(y1), r2=217(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 209
LDI r2, 217
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
