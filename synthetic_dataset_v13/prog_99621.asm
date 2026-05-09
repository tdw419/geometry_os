; DESCRIPTION: Draws a red line from (418, 30) to (278, 222).
; PLAN: r0=418(x1), r1=30(y1), r2=278(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 30
LDI r2, 278
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
