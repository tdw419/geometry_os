; DESCRIPTION: Draws a orange line from (153, 233) to (224, 42).
; PLAN: r0=153(x1), r1=233(y1), r2=224(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 233
LDI r2, 224
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
