; DESCRIPTION: Draws a red line from (128, 46) to (222, 199).
; PLAN: r0=128(x1), r1=46(y1), r2=222(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 46
LDI r2, 222
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
