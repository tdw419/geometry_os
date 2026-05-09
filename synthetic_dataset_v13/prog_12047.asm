; DESCRIPTION: Renders a yellow line between points (332, 180) and (67, 178).
; PLAN: r0=332(x1), r1=180(y1), r2=67(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 180
LDI r2, 67
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
