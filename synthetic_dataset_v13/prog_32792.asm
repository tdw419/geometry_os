; DESCRIPTION: Creates a black rectangular region at (108, 27) spanning 24 by 116 pixels.
; PLAN: r0=108(x), r1=27(y), r2=24(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 27
LDI r2, 24
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
