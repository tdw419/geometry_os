; DESCRIPTION: Creates a black rectangular region at (375, 175) spanning 87 by 70 pixels.
; PLAN: r0=375(x), r1=175(y), r2=87(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 175
LDI r2, 87
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
