; DESCRIPTION: Renders a black line between points (299, 55) and (373, 40).
; PLAN: r0=299(x1), r1=55(y1), r2=373(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 55
LDI r2, 373
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
