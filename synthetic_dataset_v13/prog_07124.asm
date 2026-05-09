; DESCRIPTION: Renders a magenta line between points (289, 94) and (288, 198).
; PLAN: r0=289(x1), r1=94(y1), r2=288(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 94
LDI r2, 288
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
