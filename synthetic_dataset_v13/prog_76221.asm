; DESCRIPTION: Creates a yellow rectangular region at (167, 130) spanning 78 by 85 pixels.
; PLAN: r0=167(x), r1=130(y), r2=78(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 130
LDI r2, 78
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
