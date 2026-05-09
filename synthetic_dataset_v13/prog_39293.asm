; DESCRIPTION: Creates a black rectangular region at (114, 130) spanning 45 by 44 pixels.
; PLAN: r0=114(x), r1=130(y), r2=45(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 130
LDI r2, 45
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
