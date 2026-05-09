; DESCRIPTION: Places a black line segment connecting (342, 186) to (326, 111).
; PLAN: r0=342(x1), r1=186(y1), r2=326(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 186
LDI r2, 326
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
