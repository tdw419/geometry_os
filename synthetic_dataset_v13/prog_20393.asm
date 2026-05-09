; DESCRIPTION: Places a cyan line segment connecting (390, 238) to (284, 111).
; PLAN: r0=390(x1), r1=238(y1), r2=284(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 238
LDI r2, 284
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
