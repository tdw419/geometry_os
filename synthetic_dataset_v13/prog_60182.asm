; DESCRIPTION: Creates a black rectangular region at (129, 9) spanning 64 by 82 pixels.
; PLAN: r0=129(x), r1=9(y), r2=64(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 9
LDI r2, 64
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
