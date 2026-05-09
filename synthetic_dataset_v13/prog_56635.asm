; DESCRIPTION: Draws a yellow line from (391, 46) to (373, 64).
; PLAN: r0=391(x1), r1=46(y1), r2=373(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 46
LDI r2, 373
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
