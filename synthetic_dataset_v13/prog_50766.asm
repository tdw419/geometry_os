; DESCRIPTION: Draws a white line from (176, 14) to (38, 111).
; PLAN: r0=176(x1), r1=14(y1), r2=38(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 14
LDI r2, 38
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
