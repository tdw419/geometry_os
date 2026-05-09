; DESCRIPTION: Creates a black rectangular region at (374, 43) spanning 27 by 76 pixels.
; PLAN: r0=374(x), r1=43(y), r2=27(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 43
LDI r2, 27
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
