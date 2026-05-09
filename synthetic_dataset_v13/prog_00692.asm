; DESCRIPTION: Draws a yellow line from (110, 102) to (440, 80).
; PLAN: r0=110(x1), r1=102(y1), r2=440(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 102
LDI r2, 440
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
