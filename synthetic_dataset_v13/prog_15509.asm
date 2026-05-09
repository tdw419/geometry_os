; DESCRIPTION: Draws a yellow line from (301, 56) to (225, 128).
; PLAN: r0=301(x1), r1=56(y1), r2=225(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 56
LDI r2, 225
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
