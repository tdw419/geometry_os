; DESCRIPTION: Creates a black rectangular region at (401, 87) spanning 67 by 118 pixels.
; PLAN: r0=401(x), r1=87(y), r2=67(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 87
LDI r2, 67
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
