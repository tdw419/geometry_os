; DESCRIPTION: Creates a yellow rectangular region at (253, 72) spanning 64 by 103 pixels.
; PLAN: r0=253(x), r1=72(y), r2=64(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 72
LDI r2, 64
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
