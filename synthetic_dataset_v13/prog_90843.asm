; DESCRIPTION: Draws a black line from (161, 40) to (236, 59).
; PLAN: r0=161(x1), r1=40(y1), r2=236(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 40
LDI r2, 236
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
