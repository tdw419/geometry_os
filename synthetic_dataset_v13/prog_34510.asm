; DESCRIPTION: Draws a yellow line from (166, 237) to (136, 207).
; PLAN: r0=166(x1), r1=237(y1), r2=136(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 237
LDI r2, 136
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
