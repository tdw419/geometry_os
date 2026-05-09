; DESCRIPTION: Draws a yellow line from (431, 173) to (431, 14).
; PLAN: r0=431(x1), r1=173(y1), r2=431(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 173
LDI r2, 431
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
