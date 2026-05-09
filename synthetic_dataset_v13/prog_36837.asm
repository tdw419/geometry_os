; DESCRIPTION: Creates a red rectangular region at (466, 96) spanning 14 by 64 pixels.
; PLAN: r0=466(x), r1=96(y), r2=14(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 96
LDI r2, 14
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
