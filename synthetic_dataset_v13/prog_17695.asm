; DESCRIPTION: Creates a orange rectangular region at (108, 59) spanning 28 by 85 pixels.
; PLAN: r0=108(x), r1=59(y), r2=28(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 59
LDI r2, 28
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
