; DESCRIPTION: Creates a black rectangular region at (418, 60) spanning 30 by 86 pixels.
; PLAN: r0=418(x), r1=60(y), r2=30(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 60
LDI r2, 30
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
