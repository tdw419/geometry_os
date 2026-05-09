; DESCRIPTION: Creates a orange rectangular region at (380, 76) spanning 80 by 78 pixels.
; PLAN: r0=380(x), r1=76(y), r2=80(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 76
LDI r2, 80
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
