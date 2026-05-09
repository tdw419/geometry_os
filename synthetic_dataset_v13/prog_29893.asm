; DESCRIPTION: Creates a black rectangular region at (165, 74) spanning 49 by 38 pixels.
; PLAN: r0=165(x), r1=74(y), r2=49(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 74
LDI r2, 49
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
