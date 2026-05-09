; DESCRIPTION: Creates a black rectangular region at (338, 82) spanning 114 by 50 pixels.
; PLAN: r0=338(x), r1=82(y), r2=114(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 82
LDI r2, 114
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
