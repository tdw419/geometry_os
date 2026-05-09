; DESCRIPTION: Creates a yellow rectangular region at (375, 74) spanning 83 by 67 pixels.
; PLAN: r0=375(x), r1=74(y), r2=83(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 74
LDI r2, 83
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
