; DESCRIPTION: Creates a purple rectangular region at (139, 67) spanning 27 by 46 pixels.
; PLAN: r0=139(x), r1=67(y), r2=27(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 67
LDI r2, 27
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
