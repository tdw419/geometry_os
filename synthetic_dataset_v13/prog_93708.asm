; DESCRIPTION: Creates a purple rectangular region at (281, 62) spanning 67 by 44 pixels.
; PLAN: r0=281(x), r1=62(y), r2=67(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 62
LDI r2, 67
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
