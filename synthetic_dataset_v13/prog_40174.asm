; DESCRIPTION: Draws a yellow line from (63, 134) to (248, 202).
; PLAN: r0=63(x1), r1=134(y1), r2=248(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 134
LDI r2, 248
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
