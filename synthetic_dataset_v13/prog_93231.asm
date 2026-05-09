; DESCRIPTION: Draws a black line from (218, 95) to (19, 217).
; PLAN: r0=218(x1), r1=95(y1), r2=19(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 95
LDI r2, 19
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
