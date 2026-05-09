; DESCRIPTION: Draws a yellow line from (191, 171) to (428, 81).
; PLAN: r0=191(x1), r1=171(y1), r2=428(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 171
LDI r2, 428
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
