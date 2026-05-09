; DESCRIPTION: Creates a purple rectangular region at (449, 78) spanning 45 by 67 pixels.
; PLAN: r0=449(x), r1=78(y), r2=45(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 78
LDI r2, 45
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
