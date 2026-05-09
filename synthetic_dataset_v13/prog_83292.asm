; DESCRIPTION: Creates a black rectangular region at (173, 130) spanning 104 by 49 pixels.
; PLAN: r0=173(x), r1=130(y), r2=104(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 130
LDI r2, 104
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
