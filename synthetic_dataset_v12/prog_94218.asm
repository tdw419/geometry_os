; DESCRIPTION: Draws a black line from (276, 21) to (510, 102).
; PLAN: r0=276(x1), r1=21(y1), r2=510(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 21
LDI r2, 510
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
