; DESCRIPTION: Creates a black rectangular region at (1, 28) spanning 45 by 69 pixels.
; PLAN: r0=1(x), r1=28(y), r2=45(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 28
LDI r2, 45
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
