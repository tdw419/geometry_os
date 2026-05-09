; DESCRIPTION: Draws a yellow line from (63, 71) to (475, 75).
; PLAN: r0=63(x1), r1=71(y1), r2=475(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 71
LDI r2, 475
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
