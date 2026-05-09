; DESCRIPTION: Renders a white line between points (499, 136) and (202, 72).
; PLAN: r0=499(x1), r1=136(y1), r2=202(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 136
LDI r2, 202
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
