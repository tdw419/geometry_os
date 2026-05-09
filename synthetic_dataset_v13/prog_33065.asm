; DESCRIPTION: Draws a green line from (62, 174) to (376, 8).
; PLAN: r0=62(x1), r1=174(y1), r2=376(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 174
LDI r2, 376
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
