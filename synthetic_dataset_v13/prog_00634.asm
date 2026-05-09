; DESCRIPTION: Renders a black line between points (415, 130) and (59, 122).
; PLAN: r0=415(x1), r1=130(y1), r2=59(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 130
LDI r2, 59
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
