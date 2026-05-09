; DESCRIPTION: Creates a black rectangular region at (420, 63) spanning 76 by 61 pixels.
; PLAN: r0=420(x), r1=63(y), r2=76(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 63
LDI r2, 76
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
