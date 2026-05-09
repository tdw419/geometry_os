; DESCRIPTION: Draws a cyan line from (132, 1) to (442, 111).
; PLAN: r0=132(x1), r1=1(y1), r2=442(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 1
LDI r2, 442
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
