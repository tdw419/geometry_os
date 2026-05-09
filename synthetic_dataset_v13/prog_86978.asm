; DESCRIPTION: Creates a orange rectangular region at (394, 14) spanning 59 by 108 pixels.
; PLAN: r0=394(x), r1=14(y), r2=59(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 14
LDI r2, 59
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
