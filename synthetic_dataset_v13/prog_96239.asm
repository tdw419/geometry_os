; DESCRIPTION: Creates a black rectangular region at (416, 60) spanning 83 by 115 pixels.
; PLAN: r0=416(x), r1=60(y), r2=83(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 60
LDI r2, 83
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
