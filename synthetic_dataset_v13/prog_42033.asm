; DESCRIPTION: Draws a red line from (201, 221) to (455, 13).
; PLAN: r0=201(x1), r1=221(y1), r2=455(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 221
LDI r2, 455
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
