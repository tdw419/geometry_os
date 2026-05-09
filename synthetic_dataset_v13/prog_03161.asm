; DESCRIPTION: Creates a red rectangular region at (332, 64) spanning 49 by 113 pixels.
; PLAN: r0=332(x), r1=64(y), r2=49(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 64
LDI r2, 49
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
