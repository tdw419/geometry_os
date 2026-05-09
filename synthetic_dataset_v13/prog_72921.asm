; DESCRIPTION: Creates a orange rectangular region at (111, 191) spanning 69 by 55 pixels.
; PLAN: r0=111(x), r1=191(y), r2=69(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 191
LDI r2, 69
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
