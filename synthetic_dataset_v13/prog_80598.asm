; DESCRIPTION: Draws a orange line from (271, 49) to (165, 209).
; PLAN: r0=271(x1), r1=49(y1), r2=165(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 49
LDI r2, 165
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
