; DESCRIPTION: Creates a orange rectangular region at (172, 5) spanning 65 by 70 pixels.
; PLAN: r0=172(x), r1=5(y), r2=65(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 5
LDI r2, 65
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
