; DESCRIPTION: Draws a red line from (58, 57) to (384, 110).
; PLAN: r0=58(x1), r1=57(y1), r2=384(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 57
LDI r2, 384
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
