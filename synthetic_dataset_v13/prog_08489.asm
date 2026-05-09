; DESCRIPTION: Draws a white line from (321, 238) to (61, 39).
; PLAN: r0=321(x1), r1=238(y1), r2=61(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 238
LDI r2, 61
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
