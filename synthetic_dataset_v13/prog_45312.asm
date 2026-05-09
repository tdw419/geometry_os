; DESCRIPTION: Draws a yellow line from (207, 71) to (272, 98).
; PLAN: r0=207(x1), r1=71(y1), r2=272(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 71
LDI r2, 272
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
