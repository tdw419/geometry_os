; DESCRIPTION: Draws a green line from (354, 49) to (125, 36).
; PLAN: r0=354(x1), r1=49(y1), r2=125(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 49
LDI r2, 125
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
