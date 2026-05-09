; DESCRIPTION: Draws a yellow line from (437, 188) to (231, 186).
; PLAN: r0=437(x1), r1=188(y1), r2=231(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 188
LDI r2, 231
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
