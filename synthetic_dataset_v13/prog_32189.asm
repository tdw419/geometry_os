; DESCRIPTION: Creates a black rectangular region at (60, 53) spanning 12 by 38 pixels.
; PLAN: r0=60(x), r1=53(y), r2=12(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 53
LDI r2, 12
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
