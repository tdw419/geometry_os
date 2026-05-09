; DESCRIPTION: Draws a black line from (170, 80) to (392, 111).
; PLAN: r0=170(x1), r1=80(y1), r2=392(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 80
LDI r2, 392
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
