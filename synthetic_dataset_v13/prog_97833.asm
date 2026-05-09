; DESCRIPTION: Creates a black rectangular region at (55, 90) spanning 55 by 70 pixels.
; PLAN: r0=55(x), r1=90(y), r2=55(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 90
LDI r2, 55
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
