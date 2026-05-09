; DESCRIPTION: Creates a red rectangular region at (340, 122) spanning 94 by 67 pixels.
; PLAN: r0=340(x), r1=122(y), r2=94(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 122
LDI r2, 94
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
