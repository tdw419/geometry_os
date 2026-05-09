; DESCRIPTION: Creates a blue rectangular region at (329, 23) spanning 67 by 105 pixels.
; PLAN: r0=329(x), r1=23(y), r2=67(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 23
LDI r2, 67
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
