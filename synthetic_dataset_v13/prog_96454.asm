; DESCRIPTION: Draws a green line from (363, 240) to (143, 130).
; PLAN: r0=363(x1), r1=240(y1), r2=143(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 240
LDI r2, 143
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
