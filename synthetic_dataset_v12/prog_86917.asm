; DESCRIPTION: Draws a orange line from (464, 103) to (84, 224).
; PLAN: r0=464(x1), r1=103(y1), r2=84(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 103
LDI r2, 84
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
