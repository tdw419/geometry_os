; DESCRIPTION: Draws a green line from (418, 91) to (226, 23).
; PLAN: r0=418(x1), r1=91(y1), r2=226(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 91
LDI r2, 226
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
