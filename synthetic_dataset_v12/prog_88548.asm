; DESCRIPTION: Draws a cyan line from (227, 174) to (498, 147).
; PLAN: r0=227(x1), r1=174(y1), r2=498(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 174
LDI r2, 498
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
