; DESCRIPTION: Places a black line segment connecting (317, 226) to (303, 111).
; PLAN: r0=317(x1), r1=226(y1), r2=303(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 226
LDI r2, 303
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
