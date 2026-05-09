; DESCRIPTION: Draws a red line from (210, 155) to (94, 92).
; PLAN: r0=210(x1), r1=155(y1), r2=94(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 155
LDI r2, 94
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
