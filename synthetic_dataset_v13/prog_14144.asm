; DESCRIPTION: Draws a yellow line from (183, 55) to (271, 217).
; PLAN: r0=183(x1), r1=55(y1), r2=271(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 55
LDI r2, 271
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
