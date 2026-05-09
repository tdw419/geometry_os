; DESCRIPTION: Draws a white line from (380, 132) to (412, 238).
; PLAN: r0=380(x1), r1=132(y1), r2=412(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 132
LDI r2, 412
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
