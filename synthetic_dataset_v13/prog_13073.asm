; DESCRIPTION: Creates a orange rectangular region at (92, 69) spanning 108 by 16 pixels.
; PLAN: r0=92(x), r1=69(y), r2=108(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 69
LDI r2, 108
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
