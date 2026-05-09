; DESCRIPTION: Creates a magenta rectangular region at (224, 89) spanning 75 by 41 pixels.
; PLAN: r0=224(x), r1=89(y), r2=75(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 89
LDI r2, 75
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
