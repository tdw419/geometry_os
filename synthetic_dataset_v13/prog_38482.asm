; DESCRIPTION: Draws a green line from (266, 188) to (437, 246).
; PLAN: r0=266(x1), r1=188(y1), r2=437(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 188
LDI r2, 437
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
