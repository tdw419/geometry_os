; DESCRIPTION: Draws a yellow line from (282, 249) to (102, 231).
; PLAN: r0=282(x1), r1=249(y1), r2=102(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 249
LDI r2, 102
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
