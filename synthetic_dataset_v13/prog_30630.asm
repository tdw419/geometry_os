; DESCRIPTION: Draws a green line from (115, 245) to (372, 248).
; PLAN: r0=115(x1), r1=245(y1), r2=372(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 245
LDI r2, 372
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
