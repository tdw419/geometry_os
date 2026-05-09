; DESCRIPTION: Creates a red rectangular region at (192, 67) spanning 107 by 103 pixels.
; PLAN: r0=192(x), r1=67(y), r2=107(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 67
LDI r2, 107
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
