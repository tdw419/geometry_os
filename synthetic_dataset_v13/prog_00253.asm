; DESCRIPTION: Creates a red rectangular region at (203, 181) spanning 58 by 28 pixels.
; PLAN: r0=203(x), r1=181(y), r2=58(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 181
LDI r2, 58
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
