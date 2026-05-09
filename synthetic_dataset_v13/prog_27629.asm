; DESCRIPTION: Draws a black line from (94, 123) to (332, 242).
; PLAN: r0=94(x1), r1=123(y1), r2=332(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 123
LDI r2, 332
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
