; DESCRIPTION: Draws a red line from (144, 198) to (6, 231).
; PLAN: r0=144(x1), r1=198(y1), r2=6(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 198
LDI r2, 6
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
