; DESCRIPTION: Draws a white line from (351, 228) to (323, 65).
; PLAN: r0=351(x1), r1=228(y1), r2=323(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 228
LDI r2, 323
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
