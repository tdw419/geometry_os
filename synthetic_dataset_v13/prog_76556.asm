; DESCRIPTION: Draws a green line from (72, 204) to (187, 245).
; PLAN: r0=72(x1), r1=204(y1), r2=187(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 204
LDI r2, 187
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
