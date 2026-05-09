; DESCRIPTION: Creates a white rectangular region at (269, 76) spanning 108 by 85 pixels.
; PLAN: r0=269(x), r1=76(y), r2=108(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 76
LDI r2, 108
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
