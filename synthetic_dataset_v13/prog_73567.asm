; DESCRIPTION: Creates a white rectangular region at (117, 103) spanning 88 by 103 pixels.
; PLAN: r0=117(x), r1=103(y), r2=88(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 103
LDI r2, 88
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
