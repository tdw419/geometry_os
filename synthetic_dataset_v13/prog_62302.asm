; DESCRIPTION: Draws a yellow line from (315, 186) to (105, 111).
; PLAN: r0=315(x1), r1=186(y1), r2=105(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 186
LDI r2, 105
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
