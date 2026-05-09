; DESCRIPTION: Draws a black line from (355, 29) to (356, 46).
; PLAN: r0=355(x1), r1=29(y1), r2=356(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 29
LDI r2, 356
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
