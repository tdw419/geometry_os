; DESCRIPTION: Draws a yellow line from (198, 42) to (451, 85).
; PLAN: r0=198(x1), r1=42(y1), r2=451(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 42
LDI r2, 451
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
