; DESCRIPTION: Creates a red rectangular region at (119, 67) spanning 115 by 30 pixels.
; PLAN: r0=119(x), r1=67(y), r2=115(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 67
LDI r2, 115
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
