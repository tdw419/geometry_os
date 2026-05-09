; DESCRIPTION: Creates a black rectangular region at (299, 120) spanning 32 by 39 pixels.
; PLAN: r0=299(x), r1=120(y), r2=32(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 120
LDI r2, 32
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
