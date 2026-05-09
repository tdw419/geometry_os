; DESCRIPTION: Creates a black rectangular region at (188, 130) spanning 43 by 28 pixels.
; PLAN: r0=188(x), r1=130(y), r2=43(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 130
LDI r2, 43
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
