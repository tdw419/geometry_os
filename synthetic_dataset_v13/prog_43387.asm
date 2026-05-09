; DESCRIPTION: Creates a black rectangular region at (224, 7) spanning 108 by 26 pixels.
; PLAN: r0=224(x), r1=7(y), r2=108(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 7
LDI r2, 108
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
