; DESCRIPTION: Renders a yellow line between points (349, 127) and (485, 32).
; PLAN: r0=349(x1), r1=127(y1), r2=485(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 127
LDI r2, 485
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
