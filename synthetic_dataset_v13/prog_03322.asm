; DESCRIPTION: Draws a yellow line from (489, 91) to (445, 21).
; PLAN: r0=489(x1), r1=91(y1), r2=445(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 91
LDI r2, 445
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
