; DESCRIPTION: Draws a cyan line from (318, 22) to (349, 181).
; PLAN: r0=318(x1), r1=22(y1), r2=349(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 22
LDI r2, 349
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
