; DESCRIPTION: Creates a red rectangular region at (337, 217) spanning 67 by 32 pixels.
; PLAN: r0=337(x), r1=217(y), r2=67(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 217
LDI r2, 67
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
