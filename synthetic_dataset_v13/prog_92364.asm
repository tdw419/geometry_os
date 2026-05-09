; DESCRIPTION: Creates a orange rectangular region at (148, 148) spanning 82 by 69 pixels.
; PLAN: r0=148(x), r1=148(y), r2=82(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 148
LDI r2, 82
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
