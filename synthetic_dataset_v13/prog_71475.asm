; DESCRIPTION: Draws a cyan line from (136, 147) to (128, 62).
; PLAN: r0=136(x1), r1=147(y1), r2=128(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 147
LDI r2, 128
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
