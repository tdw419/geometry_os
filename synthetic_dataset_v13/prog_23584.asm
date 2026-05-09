; DESCRIPTION: Places a red line segment connecting (381, 197) to (414, 143).
; PLAN: r0=381(x1), r1=197(y1), r2=414(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 197
LDI r2, 414
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
