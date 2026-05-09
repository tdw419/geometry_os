; DESCRIPTION: Draws a purple line from (291, 128) to (281, 168).
; PLAN: r0=291(x1), r1=128(y1), r2=281(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 128
LDI r2, 281
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
