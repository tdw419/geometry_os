; DESCRIPTION: Draws a cyan line from (323, 12) to (332, 129).
; PLAN: r0=323(x1), r1=12(y1), r2=332(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 12
LDI r2, 332
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
