; DESCRIPTION: Draws a orange line from (271, 225) to (27, 163).
; PLAN: r0=271(x1), r1=225(y1), r2=27(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 225
LDI r2, 27
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
