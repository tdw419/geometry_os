; DESCRIPTION: Creates a yellow rectangular region at (255, 70) spanning 108 by 88 pixels.
; PLAN: r0=255(x), r1=70(y), r2=108(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 70
LDI r2, 108
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
