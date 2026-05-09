; DESCRIPTION: Creates a black rectangular region at (207, 82) spanning 86 by 84 pixels.
; PLAN: r0=207(x), r1=82(y), r2=86(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 82
LDI r2, 86
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
