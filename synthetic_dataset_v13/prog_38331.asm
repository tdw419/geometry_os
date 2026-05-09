; DESCRIPTION: Renders a green line between points (510, 236) and (316, 199).
; PLAN: r0=510(x1), r1=236(y1), r2=316(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 236
LDI r2, 316
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
