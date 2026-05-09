; DESCRIPTION: Draws a red line from (364, 38) to (299, 187).
; PLAN: r0=364(x1), r1=38(y1), r2=299(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 38
LDI r2, 299
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
