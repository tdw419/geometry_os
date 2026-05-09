; DESCRIPTION: Draws a cyan line from (364, 136) to (188, 176).
; PLAN: r0=364(x1), r1=136(y1), r2=188(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 136
LDI r2, 188
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
