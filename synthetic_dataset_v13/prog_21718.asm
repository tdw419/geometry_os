; DESCRIPTION: Creates a yellow rectangular region at (30, 28) spanning 103 by 117 pixels.
; PLAN: r0=30(x), r1=28(y), r2=103(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 28
LDI r2, 103
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
