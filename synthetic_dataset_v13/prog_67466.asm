; DESCRIPTION: Draws a black line from (391, 173) to (33, 118).
; PLAN: r0=391(x1), r1=173(y1), r2=33(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 173
LDI r2, 33
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
