; DESCRIPTION: Places a black line segment connecting (480, 230) to (300, 111).
; PLAN: r0=480(x1), r1=230(y1), r2=300(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 230
LDI r2, 300
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
