; DESCRIPTION: Draws a black line from (314, 108) to (115, 210).
; PLAN: r0=314(x1), r1=108(y1), r2=115(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 108
LDI r2, 115
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
