; DESCRIPTION: Draws a blue line from (9, 234) to (321, 111).
; PLAN: r0=9(x1), r1=234(y1), r2=321(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 234
LDI r2, 321
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
