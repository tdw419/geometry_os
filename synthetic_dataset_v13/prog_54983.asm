; DESCRIPTION: Draws a red line from (464, 241) to (468, 101).
; PLAN: r0=464(x1), r1=241(y1), r2=468(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 241
LDI r2, 468
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
