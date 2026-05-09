; DESCRIPTION: Draws a black line from (420, 244) to (129, 92).
; PLAN: r0=420(x1), r1=244(y1), r2=129(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 244
LDI r2, 129
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
