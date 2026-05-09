; DESCRIPTION: Draws a yellow line from (359, 184) to (213, 214).
; PLAN: r0=359(x1), r1=184(y1), r2=213(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 184
LDI r2, 213
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
