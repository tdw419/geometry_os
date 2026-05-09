; DESCRIPTION: Creates a red rectangular region at (53, 126) spanning 66 by 72 pixels.
; PLAN: r0=53(x), r1=126(y), r2=66(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 126
LDI r2, 66
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
