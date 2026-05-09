; DESCRIPTION: Creates a black rectangular region at (416, 39) spanning 59 by 21 pixels.
; PLAN: r0=416(x), r1=39(y), r2=59(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 39
LDI r2, 59
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
