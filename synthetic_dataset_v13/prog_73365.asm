; DESCRIPTION: Draws a yellow line from (378, 124) to (226, 111).
; PLAN: r0=378(x1), r1=124(y1), r2=226(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 124
LDI r2, 226
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
