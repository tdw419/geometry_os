; DESCRIPTION: Draws a blue line from (289, 129) to (174, 95).
; PLAN: r0=289(x1), r1=129(y1), r2=174(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 129
LDI r2, 174
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
