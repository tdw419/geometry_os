; DESCRIPTION: Draws a yellow line from (210, 110) to (272, 192).
; PLAN: r0=210(x1), r1=110(y1), r2=272(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 110
LDI r2, 272
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
