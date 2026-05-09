; DESCRIPTION: Draws a red line from (272, 197) to (303, 104).
; PLAN: r0=272(x1), r1=197(y1), r2=303(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 197
LDI r2, 303
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
