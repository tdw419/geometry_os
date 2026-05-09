; DESCRIPTION: Draws a black line from (175, 248) to (272, 169).
; PLAN: r0=175(x1), r1=248(y1), r2=272(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 248
LDI r2, 272
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
