; DESCRIPTION: Draws a orange line from (320, 236) to (176, 17).
; PLAN: r0=320(x1), r1=236(y1), r2=176(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 236
LDI r2, 176
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
