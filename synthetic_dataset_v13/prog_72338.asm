; DESCRIPTION: Draws a orange line from (63, 233) to (121, 224).
; PLAN: r0=63(x1), r1=233(y1), r2=121(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 233
LDI r2, 121
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
