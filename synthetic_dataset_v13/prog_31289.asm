; DESCRIPTION: Draws a yellow line from (156, 232) to (248, 210).
; PLAN: r0=156(x1), r1=232(y1), r2=248(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 232
LDI r2, 248
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
