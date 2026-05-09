; DESCRIPTION: Draws a yellow line from (279, 255) to (231, 31).
; PLAN: r0=279(x1), r1=255(y1), r2=231(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 255
LDI r2, 231
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
