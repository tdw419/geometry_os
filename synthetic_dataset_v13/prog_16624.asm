; DESCRIPTION: Draws a red line from (136, 128) to (87, 133).
; PLAN: r0=136(x1), r1=128(y1), r2=87(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 128
LDI r2, 87
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
