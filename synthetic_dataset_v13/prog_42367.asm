; DESCRIPTION: Draws a yellow line from (292, 26) to (289, 164).
; PLAN: r0=292(x1), r1=26(y1), r2=289(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 26
LDI r2, 289
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
