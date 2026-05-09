; DESCRIPTION: Creates a black rectangular region at (400, 130) spanning 102 by 14 pixels.
; PLAN: r0=400(x), r1=130(y), r2=102(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 130
LDI r2, 102
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
