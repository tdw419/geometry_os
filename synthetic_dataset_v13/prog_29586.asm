; DESCRIPTION: Draws a red line from (265, 17) to (366, 160).
; PLAN: r0=265(x1), r1=17(y1), r2=366(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 17
LDI r2, 366
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
