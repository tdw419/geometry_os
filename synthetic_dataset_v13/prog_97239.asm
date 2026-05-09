; DESCRIPTION: Creates a black rectangular region at (238, 87) spanning 117 by 28 pixels.
; PLAN: r0=238(x), r1=87(y), r2=117(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 87
LDI r2, 117
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
