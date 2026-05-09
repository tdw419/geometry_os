; DESCRIPTION: Creates a blue rectangular region at (68, 182) spanning 97 by 67 pixels.
; PLAN: r0=68(x), r1=182(y), r2=97(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 182
LDI r2, 97
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
