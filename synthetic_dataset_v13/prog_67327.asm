; DESCRIPTION: Creates a cyan rectangular region at (416, 101) spanning 43 by 72 pixels.
; PLAN: r0=416(x), r1=101(y), r2=43(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 101
LDI r2, 43
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
