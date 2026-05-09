; DESCRIPTION: Renders a white line between points (59, 237) and (54, 217).
; PLAN: r0=59(x1), r1=237(y1), r2=54(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 237
LDI r2, 54
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
