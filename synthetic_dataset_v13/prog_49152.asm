; DESCRIPTION: Draws a cyan line from (147, 219) to (58, 79).
; PLAN: r0=147(x1), r1=219(y1), r2=58(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 219
LDI r2, 58
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
