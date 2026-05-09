; DESCRIPTION: Places a blue line segment connecting (503, 23) to (82, 111).
; PLAN: r0=503(x1), r1=23(y1), r2=82(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 23
LDI r2, 82
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
