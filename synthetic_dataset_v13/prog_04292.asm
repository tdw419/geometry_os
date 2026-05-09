; DESCRIPTION: Draws a yellow line from (260, 108) to (32, 37).
; PLAN: r0=260(x1), r1=108(y1), r2=32(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 108
LDI r2, 32
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
