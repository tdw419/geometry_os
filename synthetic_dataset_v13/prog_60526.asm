; DESCRIPTION: Creates a white rectangular region at (165, 130) spanning 67 by 68 pixels.
; PLAN: r0=165(x), r1=130(y), r2=67(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 130
LDI r2, 67
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
