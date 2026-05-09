; DESCRIPTION: Creates a purple rectangular region at (419, 67) spanning 42 by 72 pixels.
; PLAN: r0=419(x), r1=67(y), r2=42(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 67
LDI r2, 42
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
