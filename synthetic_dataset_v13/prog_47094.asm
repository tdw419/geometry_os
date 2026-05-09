; DESCRIPTION: Creates a orange rectangular region at (150, 55) spanning 63 by 60 pixels.
; PLAN: r0=150(x), r1=55(y), r2=63(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 55
LDI r2, 63
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
