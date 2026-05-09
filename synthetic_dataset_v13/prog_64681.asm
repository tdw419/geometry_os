; DESCRIPTION: Creates a black rectangular region at (288, 130) spanning 115 by 95 pixels.
; PLAN: r0=288(x), r1=130(y), r2=115(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 130
LDI r2, 115
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
