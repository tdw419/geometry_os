; DESCRIPTION: Renders a blue line between points (78, 36) and (346, 248).
; PLAN: r0=78(x1), r1=36(y1), r2=346(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 36
LDI r2, 346
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
