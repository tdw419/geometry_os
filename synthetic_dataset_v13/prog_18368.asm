; DESCRIPTION: Draws a white line from (63, 147) to (97, 143).
; PLAN: r0=63(x1), r1=147(y1), r2=97(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 147
LDI r2, 97
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
