; DESCRIPTION: Creates a red rectangular region at (117, 189) spanning 114 by 30 pixels.
; PLAN: r0=117(x), r1=189(y), r2=114(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 189
LDI r2, 114
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
