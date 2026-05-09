; DESCRIPTION: Draws a black line from (243, 11) to (153, 163).
; PLAN: r0=243(x1), r1=11(y1), r2=153(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 11
LDI r2, 153
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
