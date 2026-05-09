; DESCRIPTION: Draws a white line from (248, 221) to (232, 188).
; PLAN: r0=248(x1), r1=221(y1), r2=232(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 221
LDI r2, 232
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
