; DESCRIPTION: Draws a yellow line from (459, 231) to (342, 111).
; PLAN: r0=459(x1), r1=231(y1), r2=342(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 231
LDI r2, 342
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
