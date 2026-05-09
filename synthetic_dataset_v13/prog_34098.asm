; DESCRIPTION: Creates a red rectangular region at (113, 88) spanning 74 by 86 pixels.
; PLAN: r0=113(x), r1=88(y), r2=74(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 88
LDI r2, 74
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
