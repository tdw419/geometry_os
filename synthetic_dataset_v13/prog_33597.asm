; DESCRIPTION: Creates a purple rectangular region at (294, 98) spanning 101 by 67 pixels.
; PLAN: r0=294(x), r1=98(y), r2=101(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 98
LDI r2, 101
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
