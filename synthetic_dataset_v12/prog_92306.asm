; DESCRIPTION: Draws a white line from (481, 249) to (289, 105).
; PLAN: r0=481(x1), r1=249(y1), r2=289(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 249
LDI r2, 289
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
