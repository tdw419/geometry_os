; DESCRIPTION: Draws a yellow line from (229, 130) to (162, 184).
; PLAN: r0=229(x1), r1=130(y1), r2=162(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 130
LDI r2, 162
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
