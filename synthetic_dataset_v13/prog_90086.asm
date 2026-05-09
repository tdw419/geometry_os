; DESCRIPTION: Draws a yellow line from (318, 214) to (213, 202).
; PLAN: r0=318(x1), r1=214(y1), r2=213(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 214
LDI r2, 213
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
