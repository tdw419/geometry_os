; DESCRIPTION: Creates a orange rectangular region at (415, 101) spanning 43 by 59 pixels.
; PLAN: r0=415(x), r1=101(y), r2=43(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 101
LDI r2, 43
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
