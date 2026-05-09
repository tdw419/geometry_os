; DESCRIPTION: Places a yellow line segment connecting (301, 248) to (249, 32).
; PLAN: r0=301(x1), r1=248(y1), r2=249(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 248
LDI r2, 249
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
