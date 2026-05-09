; DESCRIPTION: Places a red line segment connecting (70, 141) to (500, 111).
; PLAN: r0=70(x1), r1=141(y1), r2=500(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 141
LDI r2, 500
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
