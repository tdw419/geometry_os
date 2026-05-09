; DESCRIPTION: Draws a black line from (349, 240) to (102, 214).
; PLAN: r0=349(x1), r1=240(y1), r2=102(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 240
LDI r2, 102
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
