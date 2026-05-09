; DESCRIPTION: Renders a yellow line between points (80, 67) and (245, 167).
; PLAN: r0=80(x1), r1=67(y1), r2=245(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 67
LDI r2, 245
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
