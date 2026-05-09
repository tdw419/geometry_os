; DESCRIPTION: Draws a yellow line from (94, 236) to (508, 153).
; PLAN: r0=94(x1), r1=236(y1), r2=508(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 236
LDI r2, 508
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
