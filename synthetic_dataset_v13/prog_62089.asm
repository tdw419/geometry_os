; DESCRIPTION: Creates a black rectangular region at (30, 39) spanning 32 by 104 pixels.
; PLAN: r0=30(x), r1=39(y), r2=32(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 39
LDI r2, 32
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
