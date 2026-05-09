; DESCRIPTION: Creates a orange rectangular region at (147, 70) spanning 11 by 65 pixels.
; PLAN: r0=147(x), r1=70(y), r2=11(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 70
LDI r2, 11
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
