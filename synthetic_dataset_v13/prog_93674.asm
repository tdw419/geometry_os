; DESCRIPTION: Draws a yellow line from (332, 197) to (80, 160).
; PLAN: r0=332(x1), r1=197(y1), r2=80(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 197
LDI r2, 80
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
