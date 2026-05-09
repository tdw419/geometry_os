; DESCRIPTION: Draws a yellow line from (417, 64) to (471, 243).
; PLAN: r0=417(x1), r1=64(y1), r2=471(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 64
LDI r2, 471
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
