; DESCRIPTION: Draws a yellow line from (489, 1) to (57, 166).
; PLAN: r0=489(x1), r1=1(y1), r2=57(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 1
LDI r2, 57
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
