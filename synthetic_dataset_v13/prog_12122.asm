; DESCRIPTION: Draws a yellow line from (5, 80) to (265, 231).
; PLAN: r0=5(x1), r1=80(y1), r2=265(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 80
LDI r2, 265
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
