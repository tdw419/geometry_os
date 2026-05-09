; DESCRIPTION: Draws a white line from (289, 129) to (358, 6).
; PLAN: r0=289(x1), r1=129(y1), r2=358(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 129
LDI r2, 358
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
