; DESCRIPTION: Draws a black line from (315, 156) to (504, 111).
; PLAN: r0=315(x1), r1=156(y1), r2=504(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 156
LDI r2, 504
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
