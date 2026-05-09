; DESCRIPTION: Places a red line segment connecting (491, 197) to (154, 111).
; PLAN: r0=491(x1), r1=197(y1), r2=154(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 197
LDI r2, 154
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
