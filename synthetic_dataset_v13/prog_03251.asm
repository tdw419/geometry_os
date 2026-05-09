; DESCRIPTION: Creates a purple rectangular region at (154, 67) spanning 55 by 44 pixels.
; PLAN: r0=154(x), r1=67(y), r2=55(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 67
LDI r2, 55
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
