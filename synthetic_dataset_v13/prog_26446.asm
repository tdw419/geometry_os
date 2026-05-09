; DESCRIPTION: Draws a red line from (380, 122) to (475, 111).
; PLAN: r0=380(x1), r1=122(y1), r2=475(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 122
LDI r2, 475
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
