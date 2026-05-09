; DESCRIPTION: Draws a green line from (283, 18) to (396, 187).
; PLAN: r0=283(x1), r1=18(y1), r2=396(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 18
LDI r2, 396
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
