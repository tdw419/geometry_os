; DESCRIPTION: Creates a orange rectangular region at (56, 50) spanning 92 by 108 pixels.
; PLAN: r0=56(x), r1=50(y), r2=92(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 50
LDI r2, 92
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
