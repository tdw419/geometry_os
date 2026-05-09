; DESCRIPTION: Draws a red line from (113, 170) to (402, 160).
; PLAN: r0=113(x1), r1=170(y1), r2=402(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 170
LDI r2, 402
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
