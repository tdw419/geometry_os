; DESCRIPTION: Draws a white line from (297, 159) to (468, 246).
; PLAN: r0=297(x1), r1=159(y1), r2=468(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 159
LDI r2, 468
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
