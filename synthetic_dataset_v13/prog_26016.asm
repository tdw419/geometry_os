; DESCRIPTION: Draws a white line from (8, 245) to (389, 156).
; PLAN: r0=8(x1), r1=245(y1), r2=389(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 245
LDI r2, 389
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
