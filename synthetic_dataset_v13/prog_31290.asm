; DESCRIPTION: Creates a yellow rectangular region at (104, 128) spanning 14 by 100 pixels.
; PLAN: r0=104(x), r1=128(y), r2=14(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 128
LDI r2, 14
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
