; DESCRIPTION: Creates a yellow rectangular region at (62, 175) spanning 50 by 46 pixels.
; PLAN: r0=62(x), r1=175(y), r2=50(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 175
LDI r2, 50
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
