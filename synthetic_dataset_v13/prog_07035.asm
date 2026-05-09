; DESCRIPTION: Creates a magenta rectangular region at (128, 114) spanning 20 by 107 pixels.
; PLAN: r0=128(x), r1=114(y), r2=20(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 114
LDI r2, 20
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
