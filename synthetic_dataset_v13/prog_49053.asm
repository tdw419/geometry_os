; DESCRIPTION: Draws a white line from (150, 14) to (428, 111).
; PLAN: r0=150(x1), r1=14(y1), r2=428(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 14
LDI r2, 428
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
