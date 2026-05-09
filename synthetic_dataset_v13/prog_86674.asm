; DESCRIPTION: Creates a black rectangular region at (59, 149) spanning 53 by 44 pixels.
; PLAN: r0=59(x), r1=149(y), r2=53(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 149
LDI r2, 53
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
