; DESCRIPTION: Creates a white rectangular region at (126, 67) spanning 90 by 108 pixels.
; PLAN: r0=126(x), r1=67(y), r2=90(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 67
LDI r2, 90
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
