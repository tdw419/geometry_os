; DESCRIPTION: Draws a orange line from (125, 224) to (84, 57).
; PLAN: r0=125(x1), r1=224(y1), r2=84(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 224
LDI r2, 84
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
