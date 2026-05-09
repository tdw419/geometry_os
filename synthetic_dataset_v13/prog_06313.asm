; DESCRIPTION: Draws a red line from (418, 58) to (465, 78).
; PLAN: r0=418(x1), r1=58(y1), r2=465(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 58
LDI r2, 465
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
