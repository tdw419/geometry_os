; DESCRIPTION: Creates a orange rectangular region at (304, 59) spanning 48 by 76 pixels.
; PLAN: r0=304(x), r1=59(y), r2=48(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 59
LDI r2, 48
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
