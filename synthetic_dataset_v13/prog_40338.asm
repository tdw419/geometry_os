; DESCRIPTION: Creates a orange rectangular region at (163, 165) spanning 12 by 70 pixels.
; PLAN: r0=163(x), r1=165(y), r2=12(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 165
LDI r2, 12
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
