; DESCRIPTION: Creates a white rectangular region at (459, 101) spanning 16 by 99 pixels.
; PLAN: r0=459(x), r1=101(y), r2=16(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 101
LDI r2, 16
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
