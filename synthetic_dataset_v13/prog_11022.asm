; DESCRIPTION: Creates a black rectangular region at (416, 47) spanning 53 by 86 pixels.
; PLAN: r0=416(x), r1=47(y), r2=53(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 47
LDI r2, 53
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
