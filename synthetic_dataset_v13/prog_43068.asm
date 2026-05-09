; DESCRIPTION: Creates a black rectangular region at (284, 163) spanning 69 by 84 pixels.
; PLAN: r0=284(x), r1=163(y), r2=69(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 163
LDI r2, 69
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
