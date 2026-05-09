; DESCRIPTION: Creates a orange rectangular region at (224, 75) spanning 87 by 84 pixels.
; PLAN: r0=224(x), r1=75(y), r2=87(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 75
LDI r2, 87
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
