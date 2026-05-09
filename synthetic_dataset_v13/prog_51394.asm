; DESCRIPTION: Draws a white line from (61, 238) to (241, 37).
; PLAN: r0=61(x1), r1=238(y1), r2=241(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 238
LDI r2, 241
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
