; DESCRIPTION: Draws a purple line from (53, 215) to (503, 111).
; PLAN: r0=53(x1), r1=215(y1), r2=503(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 215
LDI r2, 503
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
