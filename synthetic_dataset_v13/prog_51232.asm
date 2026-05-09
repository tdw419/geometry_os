; DESCRIPTION: Creates a orange rectangular region at (210, 108) spanning 33 by 49 pixels.
; PLAN: r0=210(x), r1=108(y), r2=33(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 108
LDI r2, 33
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
