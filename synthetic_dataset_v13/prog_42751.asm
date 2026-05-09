; DESCRIPTION: Draws a orange line from (368, 133) to (256, 176).
; PLAN: r0=368(x1), r1=133(y1), r2=256(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 133
LDI r2, 256
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
