; DESCRIPTION: Draws a yellow line from (354, 39) to (489, 86).
; PLAN: r0=354(x1), r1=39(y1), r2=489(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 39
LDI r2, 489
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
