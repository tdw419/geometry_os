; DESCRIPTION: Renders a black line between points (371, 103) and (77, 111).
; PLAN: r0=371(x1), r1=103(y1), r2=77(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 103
LDI r2, 77
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
