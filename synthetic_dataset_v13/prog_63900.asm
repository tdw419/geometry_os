; DESCRIPTION: Draws a green line from (429, 252) to (247, 111).
; PLAN: r0=429(x1), r1=252(y1), r2=247(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 252
LDI r2, 247
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
