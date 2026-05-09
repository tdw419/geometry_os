; DESCRIPTION: Creates a orange rectangular region at (28, 76) spanning 90 by 29 pixels.
; PLAN: r0=28(x), r1=76(y), r2=90(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 76
LDI r2, 90
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
