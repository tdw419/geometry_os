; DESCRIPTION: Draws a black line from (509, 236) to (428, 232).
; PLAN: r0=509(x1), r1=236(y1), r2=428(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 236
LDI r2, 428
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
