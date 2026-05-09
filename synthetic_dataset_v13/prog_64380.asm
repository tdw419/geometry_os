; DESCRIPTION: Creates a black rectangular region at (299, 135) spanning 86 by 115 pixels.
; PLAN: r0=299(x), r1=135(y), r2=86(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 135
LDI r2, 86
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
