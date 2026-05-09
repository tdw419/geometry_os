; DESCRIPTION: Creates a black rectangular region at (414, 104) spanning 90 by 113 pixels.
; PLAN: r0=414(x), r1=104(y), r2=90(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 104
LDI r2, 90
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
