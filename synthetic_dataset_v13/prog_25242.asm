; DESCRIPTION: Creates a black rectangular region at (117, 99) spanning 82 by 12 pixels.
; PLAN: r0=117(x), r1=99(y), r2=82(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 99
LDI r2, 82
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
