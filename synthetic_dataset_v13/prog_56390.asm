; DESCRIPTION: Creates a red rectangular region at (331, 130) spanning 43 by 60 pixels.
; PLAN: r0=331(x), r1=130(y), r2=43(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 130
LDI r2, 43
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
