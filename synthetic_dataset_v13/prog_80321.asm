; DESCRIPTION: Creates a black rectangular region at (336, 37) spanning 86 by 38 pixels.
; PLAN: r0=336(x), r1=37(y), r2=86(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 37
LDI r2, 86
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
