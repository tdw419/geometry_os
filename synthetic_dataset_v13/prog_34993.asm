; DESCRIPTION: Creates a red rectangular region at (459, 37) spanning 18 by 101 pixels.
; PLAN: r0=459(x), r1=37(y), r2=18(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 37
LDI r2, 18
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
