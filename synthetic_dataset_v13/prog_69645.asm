; DESCRIPTION: Draws a red line from (467, 136) to (332, 193).
; PLAN: r0=467(x1), r1=136(y1), r2=332(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 136
LDI r2, 332
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
