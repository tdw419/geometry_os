; DESCRIPTION: Creates a cyan rectangular region at (53, 130) spanning 105 by 100 pixels.
; PLAN: r0=53(x), r1=130(y), r2=105(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 130
LDI r2, 105
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
