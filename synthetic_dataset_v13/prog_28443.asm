; DESCRIPTION: Creates a purple rectangular region at (24, 107) spanning 20 by 67 pixels.
; PLAN: r0=24(x), r1=107(y), r2=20(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 107
LDI r2, 20
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
