; DESCRIPTION: Creates a red rectangular region at (9, 44) spanning 35 by 108 pixels.
; PLAN: r0=9(x), r1=44(y), r2=35(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 44
LDI r2, 35
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
