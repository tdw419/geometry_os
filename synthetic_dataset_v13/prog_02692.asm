; DESCRIPTION: Creates a black rectangular region at (327, 139) spanning 14 by 64 pixels.
; PLAN: r0=327(x), r1=139(y), r2=14(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 139
LDI r2, 14
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
