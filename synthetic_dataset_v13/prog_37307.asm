; DESCRIPTION: Places a white line segment connecting (206, 155) to (223, 111).
; PLAN: r0=206(x1), r1=155(y1), r2=223(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 155
LDI r2, 223
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
