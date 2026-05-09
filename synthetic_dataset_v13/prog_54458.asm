; DESCRIPTION: Creates a black rectangular region at (164, 134) spanning 73 by 53 pixels.
; PLAN: r0=164(x), r1=134(y), r2=73(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 134
LDI r2, 73
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
