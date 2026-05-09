; DESCRIPTION: Creates a black rectangular region at (222, 24) spanning 50 by 26 pixels.
; PLAN: r0=222(x), r1=24(y), r2=50(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 24
LDI r2, 50
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
