; DESCRIPTION: Draws a white line from (324, 156) to (392, 230).
; PLAN: r0=324(x1), r1=156(y1), r2=392(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 156
LDI r2, 392
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
