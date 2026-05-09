; DESCRIPTION: Draws a yellow line from (431, 47) to (505, 214).
; PLAN: r0=431(x1), r1=47(y1), r2=505(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 47
LDI r2, 505
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
