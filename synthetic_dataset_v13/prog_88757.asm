; DESCRIPTION: Creates a black rectangular region at (214, 139) spanning 30 by 103 pixels.
; PLAN: r0=214(x), r1=139(y), r2=30(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 139
LDI r2, 30
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
