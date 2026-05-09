; DESCRIPTION: Creates a orange rectangular region at (375, 125) spanning 72 by 82 pixels.
; PLAN: r0=375(x), r1=125(y), r2=72(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 125
LDI r2, 72
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
