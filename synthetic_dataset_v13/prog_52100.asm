; DESCRIPTION: Creates a yellow rectangular region at (12, 72) spanning 35 by 103 pixels.
; PLAN: r0=12(x), r1=72(y), r2=35(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 72
LDI r2, 35
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
