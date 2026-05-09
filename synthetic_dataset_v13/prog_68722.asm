; DESCRIPTION: Draws a red line from (371, 78) to (62, 107).
; PLAN: r0=371(x1), r1=78(y1), r2=62(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 78
LDI r2, 62
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
