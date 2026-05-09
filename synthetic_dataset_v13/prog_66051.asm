; DESCRIPTION: Draws a blue line from (249, 247) to (115, 248).
; PLAN: r0=249(x1), r1=247(y1), r2=115(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 247
LDI r2, 115
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
