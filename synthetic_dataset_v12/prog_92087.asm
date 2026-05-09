; DESCRIPTION: Creates a red rectangular region at (254, 19) spanning 49 by 53 pixels.
; PLAN: r0=254(x), r1=19(y), r2=49(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 19
LDI r2, 49
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
