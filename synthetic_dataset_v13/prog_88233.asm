; DESCRIPTION: Draws a yellow line from (392, 135) to (36, 85).
; PLAN: r0=392(x1), r1=135(y1), r2=36(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 135
LDI r2, 36
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
