; DESCRIPTION: Draws a yellow line from (235, 33) to (71, 111).
; PLAN: r0=235(x1), r1=33(y1), r2=71(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 33
LDI r2, 71
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
