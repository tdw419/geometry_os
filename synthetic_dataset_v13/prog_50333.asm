; DESCRIPTION: Draws a yellow line from (321, 222) to (175, 254).
; PLAN: r0=321(x1), r1=222(y1), r2=175(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 222
LDI r2, 175
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
