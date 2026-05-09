; DESCRIPTION: Draws a yellow line from (478, 181) to (202, 161).
; PLAN: r0=478(x1), r1=181(y1), r2=202(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 181
LDI r2, 202
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
