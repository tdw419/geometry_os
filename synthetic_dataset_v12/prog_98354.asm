; DESCRIPTION: Draws a yellow line from (391, 112) to (156, 243).
; PLAN: r0=391(x1), r1=112(y1), r2=156(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 112
LDI r2, 156
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
