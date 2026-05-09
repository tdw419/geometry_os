; DESCRIPTION: Draws a black line from (38, 155) to (445, 163).
; PLAN: r0=38(x1), r1=155(y1), r2=445(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 155
LDI r2, 445
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
