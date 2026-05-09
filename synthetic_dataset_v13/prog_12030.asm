; DESCRIPTION: Draws a orange line from (371, 165) to (224, 93).
; PLAN: r0=371(x1), r1=165(y1), r2=224(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 165
LDI r2, 224
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
