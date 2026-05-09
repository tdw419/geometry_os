; DESCRIPTION: Creates a yellow rectangular region at (53, 57) spanning 76 by 47 pixels.
; PLAN: r0=53(x), r1=57(y), r2=76(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 57
LDI r2, 76
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
