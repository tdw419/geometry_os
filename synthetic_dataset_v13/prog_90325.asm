; DESCRIPTION: Draws a black line from (130, 230) to (369, 1).
; PLAN: r0=130(x1), r1=230(y1), r2=369(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 230
LDI r2, 369
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
