; DESCRIPTION: Draws a green line from (421, 245) to (351, 16).
; PLAN: r0=421(x1), r1=245(y1), r2=351(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 245
LDI r2, 351
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
