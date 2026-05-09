; DESCRIPTION: Renders a yellow line between points (415, 52) and (485, 53).
; PLAN: r0=415(x1), r1=52(y1), r2=485(x2), r3=53(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 52
LDI r2, 485
LDI r3, 53
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
