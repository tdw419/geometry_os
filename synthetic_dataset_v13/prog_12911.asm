; DESCRIPTION: Draws a orange line from (144, 154) to (240, 224).
; PLAN: r0=144(x1), r1=154(y1), r2=240(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 154
LDI r2, 240
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
