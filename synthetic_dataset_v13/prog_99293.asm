; DESCRIPTION: Draws a yellow line from (435, 97) to (392, 252).
; PLAN: r0=435(x1), r1=97(y1), r2=392(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 97
LDI r2, 392
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
