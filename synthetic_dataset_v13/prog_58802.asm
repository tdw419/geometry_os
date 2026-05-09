; DESCRIPTION: Draws a red line from (148, 96) to (153, 17).
; PLAN: r0=148(x1), r1=96(y1), r2=153(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 96
LDI r2, 153
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
