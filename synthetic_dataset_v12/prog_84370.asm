; DESCRIPTION: Creates a black rectangular region at (185, 130) spanning 23 by 33 pixels.
; PLAN: r0=185(x), r1=130(y), r2=23(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 130
LDI r2, 23
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
