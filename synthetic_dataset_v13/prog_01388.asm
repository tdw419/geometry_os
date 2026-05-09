; DESCRIPTION: Places a orange line segment connecting (282, 66) to (146, 111).
; PLAN: r0=282(x1), r1=66(y1), r2=146(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 66
LDI r2, 146
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
