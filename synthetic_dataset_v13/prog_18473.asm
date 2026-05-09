; DESCRIPTION: Creates a black rectangular region at (223, 130) spanning 104 by 36 pixels.
; PLAN: r0=223(x), r1=130(y), r2=104(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 130
LDI r2, 104
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
