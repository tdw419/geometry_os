; DESCRIPTION: Draws a yellow line from (319, 86) to (420, 160).
; PLAN: r0=319(x1), r1=86(y1), r2=420(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 86
LDI r2, 420
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
