; DESCRIPTION: Draws a black line from (188, 173) to (282, 192).
; PLAN: r0=188(x1), r1=173(y1), r2=282(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 173
LDI r2, 282
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
