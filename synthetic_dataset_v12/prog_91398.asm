; DESCRIPTION: Draws a black line from (330, 90) to (453, 148).
; PLAN: r0=330(x1), r1=90(y1), r2=453(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 90
LDI r2, 453
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
