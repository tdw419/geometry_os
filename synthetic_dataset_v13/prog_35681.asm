; DESCRIPTION: Draws a black line from (416, 241) to (6, 214).
; PLAN: r0=416(x1), r1=241(y1), r2=6(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 241
LDI r2, 6
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
