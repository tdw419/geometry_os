; DESCRIPTION: Draws a black line from (313, 138) to (181, 224).
; PLAN: r0=313(x1), r1=138(y1), r2=181(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 138
LDI r2, 181
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
