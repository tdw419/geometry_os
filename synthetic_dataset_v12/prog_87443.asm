; DESCRIPTION: Creates a black rectangular region at (120, 158) spanning 107 by 67 pixels.
; PLAN: r0=120(x), r1=158(y), r2=107(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 158
LDI r2, 107
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
