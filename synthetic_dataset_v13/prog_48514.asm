; DESCRIPTION: Draws a red line from (186, 148) to (181, 55).
; PLAN: r0=186(x1), r1=148(y1), r2=181(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 148
LDI r2, 181
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
