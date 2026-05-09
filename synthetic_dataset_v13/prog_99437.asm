; DESCRIPTION: Draws a green line from (299, 66) to (436, 7).
; PLAN: r0=299(x1), r1=66(y1), r2=436(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 66
LDI r2, 436
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
