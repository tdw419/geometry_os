; DESCRIPTION: Draws a orange line from (472, 173) to (442, 128).
; PLAN: r0=472(x1), r1=173(y1), r2=442(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 173
LDI r2, 442
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
