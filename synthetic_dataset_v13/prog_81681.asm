; DESCRIPTION: Creates a yellow rectangular region at (346, 159) spanning 67 by 88 pixels.
; PLAN: r0=346(x), r1=159(y), r2=67(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 159
LDI r2, 67
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
