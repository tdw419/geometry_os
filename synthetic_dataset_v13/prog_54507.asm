; DESCRIPTION: Draws a yellow line from (485, 143) to (15, 36).
; PLAN: r0=485(x1), r1=143(y1), r2=15(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 143
LDI r2, 15
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
