; DESCRIPTION: Creates a red rectangular region at (71, 52) spanning 88 by 16 pixels.
; PLAN: r0=71(x), r1=52(y), r2=88(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 52
LDI r2, 88
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
