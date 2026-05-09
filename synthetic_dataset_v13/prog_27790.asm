; DESCRIPTION: Creates a black rectangular region at (53, 109) spanning 37 by 44 pixels.
; PLAN: r0=53(x), r1=109(y), r2=37(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 109
LDI r2, 37
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
