; DESCRIPTION: Creates a red rectangular region at (6, 50) spanning 66 by 88 pixels.
; PLAN: r0=6(x), r1=50(y), r2=66(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 50
LDI r2, 66
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
