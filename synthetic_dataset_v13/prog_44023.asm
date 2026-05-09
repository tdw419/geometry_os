; DESCRIPTION: Creates a red rectangular region at (358, 88) spanning 12 by 36 pixels.
; PLAN: r0=358(x), r1=88(y), r2=12(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 88
LDI r2, 12
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
