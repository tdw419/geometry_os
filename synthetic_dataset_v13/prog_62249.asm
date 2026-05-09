; DESCRIPTION: Creates a black rectangular region at (350, 157) spanning 53 by 67 pixels.
; PLAN: r0=350(x), r1=157(y), r2=53(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 157
LDI r2, 53
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
