; DESCRIPTION: Places a purple line segment connecting (229, 239) to (292, 111).
; PLAN: r0=229(x1), r1=239(y1), r2=292(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 239
LDI r2, 292
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
