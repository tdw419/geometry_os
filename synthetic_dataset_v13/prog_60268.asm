; DESCRIPTION: Draws a red line from (432, 129) to (289, 191).
; PLAN: r0=432(x1), r1=129(y1), r2=289(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 129
LDI r2, 289
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
