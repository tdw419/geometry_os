; DESCRIPTION: Draws a yellow line from (39, 128) to (36, 205).
; PLAN: r0=39(x1), r1=128(y1), r2=36(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 128
LDI r2, 36
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
