; DESCRIPTION: Creates a black rectangular region at (255, 185) spanning 55 by 53 pixels.
; PLAN: r0=255(x), r1=185(y), r2=55(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 185
LDI r2, 55
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
