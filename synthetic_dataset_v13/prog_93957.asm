; DESCRIPTION: Draws a red line from (182, 160) to (148, 142).
; PLAN: r0=182(x1), r1=160(y1), r2=148(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 160
LDI r2, 148
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
