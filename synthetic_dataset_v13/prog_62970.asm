; DESCRIPTION: Creates a red rectangular region at (28, 167) spanning 100 by 45 pixels.
; PLAN: r0=28(x), r1=167(y), r2=100(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 167
LDI r2, 100
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
