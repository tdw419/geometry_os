; DESCRIPTION: Draws a yellow line from (394, 74) to (477, 111).
; PLAN: r0=394(x1), r1=74(y1), r2=477(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 74
LDI r2, 477
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
