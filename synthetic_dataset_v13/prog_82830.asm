; DESCRIPTION: Draws a yellow line from (391, 231) to (21, 99).
; PLAN: r0=391(x1), r1=231(y1), r2=21(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 231
LDI r2, 21
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
