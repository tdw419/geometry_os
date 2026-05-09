; DESCRIPTION: Draws a green line from (57, 199) to (510, 147).
; PLAN: r0=57(x1), r1=199(y1), r2=510(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 199
LDI r2, 510
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
