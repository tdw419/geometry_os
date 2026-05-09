; DESCRIPTION: Creates a purple rectangular region at (239, 45) spanning 67 by 81 pixels.
; PLAN: r0=239(x), r1=45(y), r2=67(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 45
LDI r2, 67
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
