; DESCRIPTION: Draws a red line from (144, 82) to (372, 176).
; PLAN: r0=144(x1), r1=82(y1), r2=372(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 82
LDI r2, 372
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
