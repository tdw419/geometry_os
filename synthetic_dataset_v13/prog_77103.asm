; DESCRIPTION: Draws a orange line from (86, 4) to (224, 56).
; PLAN: r0=86(x1), r1=4(y1), r2=224(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 4
LDI r2, 224
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
