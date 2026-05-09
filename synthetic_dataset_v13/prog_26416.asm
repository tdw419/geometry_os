; DESCRIPTION: Draws a red line from (148, 219) to (130, 240).
; PLAN: r0=148(x1), r1=219(y1), r2=130(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 219
LDI r2, 130
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
