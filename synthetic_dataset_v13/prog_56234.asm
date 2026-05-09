; DESCRIPTION: Draws a yellow line from (485, 130) to (241, 23).
; PLAN: r0=485(x1), r1=130(y1), r2=241(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 130
LDI r2, 241
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
