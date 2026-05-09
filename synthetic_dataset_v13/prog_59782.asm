; DESCRIPTION: Creates a red rectangular region at (40, 76) spanning 64 by 89 pixels.
; PLAN: r0=40(x), r1=76(y), r2=64(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 76
LDI r2, 64
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
