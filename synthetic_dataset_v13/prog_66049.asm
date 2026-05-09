; DESCRIPTION: Creates a red rectangular region at (412, 123) spanning 30 by 44 pixels.
; PLAN: r0=412(x), r1=123(y), r2=30(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 123
LDI r2, 30
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
