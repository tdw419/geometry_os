; DESCRIPTION: Creates a orange rectangular region at (322, 6) spanning 95 by 78 pixels.
; PLAN: r0=322(x), r1=6(y), r2=95(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 6
LDI r2, 95
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
