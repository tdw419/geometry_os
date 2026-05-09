; DESCRIPTION: Draws a black line from (393, 222) to (192, 62).
; PLAN: r0=393(x1), r1=222(y1), r2=192(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 222
LDI r2, 192
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
