; DESCRIPTION: Draws a green line from (409, 235) to (364, 173).
; PLAN: r0=409(x1), r1=235(y1), r2=364(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 235
LDI r2, 364
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
