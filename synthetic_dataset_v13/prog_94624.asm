; DESCRIPTION: Creates a red rectangular region at (307, 36) spanning 92 by 88 pixels.
; PLAN: r0=307(x), r1=36(y), r2=92(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 36
LDI r2, 92
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
