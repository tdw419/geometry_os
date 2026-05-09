; DESCRIPTION: Draws a cyan line from (105, 191) to (55, 147).
; PLAN: r0=105(x1), r1=191(y1), r2=55(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 191
LDI r2, 55
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
