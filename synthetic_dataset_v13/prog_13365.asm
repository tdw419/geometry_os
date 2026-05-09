; DESCRIPTION: Creates a black rectangular region at (332, 150) spanning 26 by 26 pixels.
; PLAN: r0=332(x), r1=150(y), r2=26(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 150
LDI r2, 26
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
