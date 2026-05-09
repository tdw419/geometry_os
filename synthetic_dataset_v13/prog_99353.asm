; DESCRIPTION: Draws a cyan line from (157, 11) to (5, 111).
; PLAN: r0=157(x1), r1=11(y1), r2=5(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 11
LDI r2, 5
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
