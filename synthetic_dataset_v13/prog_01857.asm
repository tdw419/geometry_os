; DESCRIPTION: Draws a black line from (385, 148) to (406, 170).
; PLAN: r0=385(x1), r1=148(y1), r2=406(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 148
LDI r2, 406
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
