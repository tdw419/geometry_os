; DESCRIPTION: Creates a red rectangular region at (76, 103) spanning 24 by 69 pixels.
; PLAN: r0=76(x), r1=103(y), r2=24(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 103
LDI r2, 24
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
