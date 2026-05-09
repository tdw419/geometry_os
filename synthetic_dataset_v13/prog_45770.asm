; DESCRIPTION: Creates a orange rectangular region at (421, 39) spanning 55 by 76 pixels.
; PLAN: r0=421(x), r1=39(y), r2=55(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 39
LDI r2, 55
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
