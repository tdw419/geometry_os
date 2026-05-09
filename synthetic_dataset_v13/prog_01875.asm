; DESCRIPTION: Creates a black rectangular region at (320, 36) spanning 31 by 12 pixels.
; PLAN: r0=320(x), r1=36(y), r2=31(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 36
LDI r2, 31
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
