; DESCRIPTION: Renders a black line between points (359, 111) and (217, 40).
; PLAN: r0=359(x1), r1=111(y1), r2=217(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 111
LDI r2, 217
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
