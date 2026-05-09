; DESCRIPTION: Creates a red rectangular region at (254, 68) spanning 101 by 103 pixels.
; PLAN: r0=254(x), r1=68(y), r2=101(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 68
LDI r2, 101
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
