; DESCRIPTION: Renders a yellow line between points (180, 67) and (214, 189).
; PLAN: r0=180(x1), r1=67(y1), r2=214(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 67
LDI r2, 214
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
