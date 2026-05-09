; DESCRIPTION: Draws a cyan line from (390, 164) to (67, 147).
; PLAN: r0=390(x1), r1=164(y1), r2=67(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 164
LDI r2, 67
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
