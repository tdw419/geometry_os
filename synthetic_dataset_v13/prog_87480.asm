; DESCRIPTION: Creates a yellow rectangular region at (35, 163) spanning 105 by 67 pixels.
; PLAN: r0=35(x), r1=163(y), r2=105(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 163
LDI r2, 105
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
